
package blogservlets;

public class blog {
    private String id;
    private String name;
    private String description;
    private String img;
    private String rating;
    
    public blog(){
        
    }

    public blog(String id, String name, String description, String img, String rating) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.img = img;
        this.rating = rating;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "blog{" + "id=" + id + ", name=" + name + ", description=" + description + ", img=" + img + ", rating=" + rating + '}';
    }
    
}