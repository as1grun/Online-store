package db;

import model.Items;
import model.Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnector {
   private static Connection connection;
   static {
       try {
           Class.forName("org.postgresql.Driver");
          connection = DriverManager.getConnection(
                  "jdbc:postgresql://localhost:5432/shop_db",
                  "postgres",
              "postgres");

       }catch (Exception e){
           e.printStackTrace();
       }
   }
   public static ArrayList<Items> getAllItem(){
       ArrayList<Items> itemsArrayList = new ArrayList<>();
       try {
           PreparedStatement statement = connection.prepareStatement(""+
                   "SELECT * FROM items ");
           ResultSet  resultSet = statement.executeQuery();
           while (resultSet.next()){
               Long id = resultSet.getLong("id");
               String name = resultSet.getString("name");
               String description = resultSet.getString("description");
               Long price = resultSet.getLong("price");

               Items item = new Items(id,name,description,price);
               itemsArrayList.add(item);
           }
           statement.close();
       }
       catch (Exception e){
           e.printStackTrace();
       }
       return itemsArrayList;

   }
    public static ArrayList<Users> getAllUser(){
        ArrayList<Users> usersArrayList = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(""+
                    "SELECT * FROM users ");
            ResultSet  resultSet = statement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("full_name");

                Users user = new Users(id,email,password,fullName);
                usersArrayList.add(user);
            }
            statement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return usersArrayList;

    }


}
