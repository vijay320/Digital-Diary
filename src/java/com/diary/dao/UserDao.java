package com.diary.dao;

import com.diary.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;

    }

    //by user and user password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
            String q = "select * from user where email=? and password=?";
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setString(1, email);
            psmt.setString(2, password);

            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                user = new User();

                String name = rs.getString("name");
                user.setName(name);

                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    //insert data in database
    public boolean saveUser(User user) {
        boolean f = false;

        try {
            //user table
            String q = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement psmt = this.con.prepareStatement(q);
            psmt.setString(1, user.getName());
            psmt.setString(2, user.getEmail());
            psmt.setString(3, user.getPassword());
            psmt.setString(4, user.getGender());
            psmt.setString(5, user.getAbout());

            psmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {

            String q = "update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
            PreparedStatement p = con.prepareStatement(q);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());

            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByNoteId(int userId) {

        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               user = new User();

                String name = rs.getString("name");
                user.setName(name);

                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile")); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
