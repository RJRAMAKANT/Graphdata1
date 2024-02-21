package com.daoclass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.beanclass.CoiceByYear;
import com.connection.DBConnection;




public class CooseByYearDao {
	public ArrayList<CoiceByYear>fgd=new ArrayList<>();
	public ArrayList<CoiceByYear>graphdata(CoiceByYear cby){
	
	
		String  year=cby.getYear();
		System.out.println(year +"");
		
		try{
			Connection con=DBConnection.getcon();
            PreparedStatement ps=con.prepareStatement("select cencode,count(*) from hbsr_coreform where left(diagOfStroke,4)=? group by cencode");
            
            ps.setString(1, year);
   
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	CoiceByYear choice = new CoiceByYear();
            	choice.setCentercode(rs.getString(1));
            	choice.setCenterdata(rs.getString(2));
            	fgd.add(choice);
            
            	
            }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return fgd;
		
	}

}
