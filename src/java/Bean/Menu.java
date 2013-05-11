/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author indraep
 */
public class Menu {
    private int id;
    private int categoryId;
    private String name;
    private String description;
    private int price;
    
    public Menu() {}
    
    public Menu(int id, int categoryId, String name, String description, int price) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.description = description;
        this.price = price;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getId() {
        return id;
    }
    
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    public int getCategoryId() {
        return categoryId;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getName() {
        return name;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    
    public int getPrice() {
        return price;
    }
}
