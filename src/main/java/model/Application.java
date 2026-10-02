package model;

public class Application {

    private String name;
    private String email;
    private String title;
    private String company;
    private String appliedDate;

    public Application(String name, String email, String title, String company, String appliedDate) {
        this.name = name;
        this.email = email;
        this.title = title;
        this.company = company;
        this.appliedDate = appliedDate;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getTitle() {
        return title;
    }

    public String getCompany() {
        return company;
    }

    public String getAppliedDate() {
        return appliedDate;
    }
}