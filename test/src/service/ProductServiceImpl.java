package service;

import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/test_module?useSSL=false";
    private String jdbcUser = "root";
    private String jdbcPassword = "123456";

    public ProductServiceImpl() {
    }

    protected Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUser,jdbcPassword);
        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }

    private void printSQLException(SQLException ex){
        for (Throwable e:ex){
            if (e instanceof SQLException){
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null){
                    System.out.println("Cause: " + t);
                    t=t.getCause();
                }
            }
        }
    }

    @Override
    public List<Product> findAllProduct() {
        List<Product> list = new ArrayList<>();
        Product product = null;
        String query = "{Call selectAllProduct()}";
        try(Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query)){
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("product.id");
                String name = resultSet.getString("product.name");
                int price = resultSet.getInt("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                String category = resultSet.getString("category.name");
                product = new Product(id,name,price,quantity,color,description,category);
                list.add(product);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return list;
    }

    @Override
    public void insertProduct(Product product) {
        String query = "{Call createProduct(?,?,?,?,?,?)}";
        try(Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query)){
            callableStatement.setString(1,product.getName());
            callableStatement.setInt(2,product.getPrice());
            callableStatement.setInt(3,product.getQuantity());
            callableStatement.setString(4,product.getColor());
            callableStatement.setString(5,product.getDescription());
            callableStatement.setString(6,product.getCategory());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public boolean deleteProduct(int id) {
        boolean delete = false;
        String query = "{Call deleteProduct(?)}";
        try(Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query)){
            callableStatement.setInt(1,id);
            delete = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return delete;
    }

    @Override
    public boolean updateProduct(Product product) {
        boolean update = false;
        String query = "{Call updateProduct(?,?,?,?,?,?,?)}";
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1, product.getId());
            callableStatement.setString(2, product.getName());
            callableStatement.setInt(3, product.getPrice());
            callableStatement.setInt(4, product.getQuantity());
            callableStatement.setString(5, product.getColor());
            callableStatement.setString(6, product.getDescription());
            callableStatement.setString(7, product.getCategory());
            update = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return update;
    }

        @Override
    public Product selectProduct(int id) {
            Product product = null;
            String query = "{Call selectProductById(?)}";
            try (Connection connection = getConnection();
                 CallableStatement callableStatement = connection.prepareCall(query)) {
                callableStatement.setInt(1, id);
                ResultSet resultSet = callableStatement.executeQuery();
                while (resultSet.next()) {
                    String name = resultSet.getString("product.name");
                    int price = resultSet.getInt("price");
                    int quantity = resultSet.getInt("quantity");
                    String color = resultSet.getString("color");
                    String description = resultSet.getString("description");
                    String category = resultSet.getString("category.name");
                    product = new Product(id, name, price, quantity, color, description, category);
                }
            }catch (SQLException e) {
                printSQLException(e);
            }
            return product;
        }

    @Override
    public List<Product> selectProductByName(String name) {
        List<Product> list = new ArrayList<>();
        Product product = null;
        String query = "{Call selectProductByName(?)}";
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setString(1, name);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("product.id");
                int price = resultSet.getInt("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                String category = resultSet.getString("category.name");
                product = new Product(id, name, price, quantity, color, description, category);
                list.add(product);
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return list;
    }
}
