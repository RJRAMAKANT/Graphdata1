package com.daoclass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.beanclass.StokeYear;
import com.connection.DBConnection;


public class StrokeDao {
	 public ArrayList<StokeYear> showAllYear() {
	        ArrayList<StokeYear> ccode1 = new ArrayList<>();
	        try {
	            Connection con = DBConnection.getcon();
	            if (con == null) {
	                System.out.println("Failed to obtain a database connection.");
	                return ccode1; // Return empty list or handle error accordingly
	            }
	            PreparedStatement ps = con.prepareStatement("select distinct left(diagOfStroke, 4) as year from hbsr_coreform where left(diagOfStroke, 4) != '' and left(diagOfStroke, 4) not in ('9999', '0202', '1801') order by left(diagOfStroke, 4) asc;");
	            ResultSet rs = ps.executeQuery();
	            System.out.println("Executing query...");

	            while (rs.next()) {
	                String centerCodeValue = rs.getString("year");
	                if (centerCodeValue != null) {
	                   StokeYear stk=new StokeYear();
	                   stk.setYear(centerCodeValue);
	                    ccode1.add(stk);
	                } else {
	                    System.out.println("Encountered a null value for center code.");
	                    // Decide how to handle null values, e.g., skip or log
	                }
	            }

	            //con.close(); // Close the connection after use

	            System.out.println("Query executed successfully.");
	            return ccode1;
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("An error occurred while processing the query: " + e.getMessage());
	            return ccode1; // Ensure to return ccode in case of exception
	        }
	    }

}
