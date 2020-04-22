package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAllProduct();
    void insertProduct(Product product);
    boolean deleteProduct(int id);
    boolean updateProduct(Product product);
    Product selectProduct(int id);
    List<Product> selectProductByName(String name);
}
