package com.daoclass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.beanclass.CenterCode;
import com.connection.DBConnection;
import com.mysql.jdbc.Statement;

import java.sql.*;  

public class DistinctYear {
    public ArrayList<CenterCode> showAllCenter() {
        ArrayList<CenterCode> ccode = new ArrayList<>();
        try {
            Connection con = DBConnection.getcon();
            if (con == null) {
                System.out.println("Failed to obtain a database connection.");
                return ccode; // Return empty list or handle error accordingly
            }
            PreparedStatement ps = con.prepareStatement("select distinct(cencode) from hbsr_coreform where  cencode!='999' order by cencode asc");
            ResultSet rs = ps.executeQuery();
            System.out.println("Executing query...");

            while (rs.next()) {
                String centerCodeValue = rs.getString("cencode");
                if (centerCodeValue != null) {
                    CenterCode cc = new CenterCode();
                    cc.setCentercode(centerCodeValue);
                    ccode.add(cc);
                } else {
                    System.out.println("Encountered a null value for center code.");
                    // Decide how to handle null values, e.g., skip or log
                }
            }

            //con.close(); // Close the connection after use

            System.out.println("Query executed successfully.");
            return ccode;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("An error occurred while processing the query: " + e.getMessage());
            return ccode; // Ensure to return ccode in case of exception
        }
    }
}
