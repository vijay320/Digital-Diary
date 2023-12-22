package com.diary.dao;

import com.diary.entities.Category;
import com.diary.entities.Notes;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotesDao {

    Connection con;

    public NotesDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            PreparedStatement psmt = con.prepareStatement(q);
            ResultSet set = psmt.executeQuery();

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean saveNote(Notes n) {
        boolean f = false;
        try {
            String q = "insert into notes(pTitle,pContent,pPic,catId,userId) values (?,?,?,?,?)";
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setString(1, n.getpTitle());
            psmt.setString(2, n.getpContent());
            psmt.setString(3, n.getpPic());
            psmt.setInt(4, n.getCatId());
            psmt.setInt(5, n.getUserId());
            psmt.executeUpdate();

            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get all notes
    public List<Notes> getAllNotes() {

        List<Notes> list = new ArrayList<>();
        //fetch all notes

        try {
            PreparedStatement p = con.prepareStatement("select * from notes order by pid desc");
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");

                Notes n = new Notes(pid, pTitle, pContent, pPic, date, catId, userId);

                list.add(n);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Notes> getNotesByCatId(int catId) {
        List<Notes> list = new ArrayList<>();
        //fetch all notes by id

        try {
            PreparedStatement p = con.prepareStatement("select * from notes where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");

                Notes n = new Notes(pid, pTitle, pContent, pPic, date, catId, userId);

                list.add(n);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Notes getNotesByNoteId(int noteId){
        Notes n=null;
        String q="select * from notes where pid=?";
        try{
        PreparedStatement p=this.con.prepareStatement(q);
        p.setInt(1, noteId);
        
        ResultSet set=p.executeQuery();
        if(set.next()){
            int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");

                n = new Notes(pid, pTitle, pContent, pPic, date, catId, userId);
            
        }
        
    }
    catch(Exception e){
    e.printStackTrace();
    }
    return n;
    }
}
