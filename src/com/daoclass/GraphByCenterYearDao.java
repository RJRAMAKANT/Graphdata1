package com.daoclass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import com.beanclass.GraphByCenterYear;
import com.connection.DBConnection;

public class GraphByCenterYearDao {
	public ArrayList<GraphByCenterYear>gbcy=new ArrayList<>();
	public ArrayList<GraphByCenterYear>graphdata(GraphByCenterYear cby){
	
	
		String  ccode=cby.getCencode();
		System.out.println(ccode +"");
		
		try{
			Connection con=DBConnection.getcon();
            PreparedStatement ps=con.prepareStatement("select left(diagOfStroke,4),count(*) from hbsr_coreform where cencode=? group by left(diagOfStroke,4)");
            
            ps.setString(1, ccode);
   
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	
            	GraphByCenterYear graphby=new GraphByCenterYear();
            	graphby.setYear(rs.getString(1));
            	graphby.setYearByData(rs.getString(2));
            	gbcy.add(graphby);
            
            	
            }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return gbcy;
		
	}

}
