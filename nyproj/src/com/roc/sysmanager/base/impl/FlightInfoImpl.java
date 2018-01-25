package com.roc.sysmanager.base.impl;

import java.sql.SQLException;
import java.util.List;

import javax.management.Query;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import com.roc.enp.entity.FlightInfo;
import com.roc.enp.entity.FlightInfoKeyword;
import com.roc.sysmanager.base.dao.FlightInfoDao;

public class FlightInfoImpl extends SqlMapDaoTemplate implements FlightInfoDao {

	public FlightInfoImpl(DaoManager arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}

	public List<FlightInfo> flightInfoList(FlightInfoKeyword keyword) {
//		String resource ="SqlMapConfig.xml";   
//        
//	       //sqlMap系统初始化完毕，开始执行update操作   
//	       try {   
//	            Reader reader = Resources.getResourceAsReader(resource);   
//	            SqlMapClient sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);   
//	            sqlMap.startTransaction();   
	//          Ibatis ibatis = new Ibatis();   
	//          ibatis.setId(new Integer(1));   
	//          ibatis.setName("Erica");   
	//          ibatis.setAge(new Integer(1));   
	//          sqlMap.insert("insertIbatis",ibatis);   
	              
//	            Ibatis ibatis = (Ibatis)sqlMap.queryForObject("getIbatis", "Erica");   
//	            System.out.println(ibatis.toString());   
//	               
//	           sqlMap.commitTransaction();   
//	       } catch (Exception e) {   
//	           // TODO: handle exception   
//	            logger.debug(e.toString());   
//	        }      
		
		return queryForList("flightInfoList",keyword);
		
	}

	public int getFlightInfoCount(FlightInfoKeyword keyword) {
		return (Integer)this.queryForObject("getFlightInfoListCount",keyword);
	}

	public Integer addFlightInfo(FlightInfo flightinfo) {
		return (Integer)insert("insertFlightInfo", flightinfo);
	}

	public FlightInfo selectById(int id) {
		return (FlightInfo)queryForObject("fightInfoById", id);
	}

	public Integer updateFlightInfo(FlightInfo flightinfo) {
		return (Integer)update("editFlightInfo", flightinfo);
	}

	public Integer deleteFlightInfo(int id) {
		return (Integer)update("deleteFlightInfo", id);
	}

	public Integer batchAddFlightInfo(List<FlightInfo> fiList){
		 	try {
		 		startBatch();
	             for (FlightInfo flightinfo : fiList) { 
	                  insert("insertFlightInfo", flightinfo); 
	             }            
	             executeBatch();
	             return 1;
			} catch (Exception e) {
				return 0;
			}
		    }

	public List<FlightInfo> queryAllForSingle() {
		
		return queryForList("queryAllForSingle",null);
	}

	public List<FlightInfo> queryByFlightDate(String flightDate) {
		return queryForList("queryByFlightDate", flightDate);
	}
}
