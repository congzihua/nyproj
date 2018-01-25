package com.flyticket.system.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.flyticket.system.beans.OrderTicketUnitBean;
import com.flyticket.system.util.ArgsUnit;
import com.flyticket.system.util.ExcelOpUnit;
import com.founder.enp.entity.Authorization;
import com.founder.enp.util.Global;
import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.BaFlightKeyWord;
import com.roc.sysmanager.base.service.ClienService;
import com.roc.sysmanager.base.service.FlightService;
import com.roc.syspe.entity.OpOrdertickets;
import com.roc.syspe.entity.OpOrderticketsKeyword;
/**
 *导出统计数据到excel文件中
 * @author congzihua
 *
 */
public class UnitsDataAction  extends DispatchAction {
	
	/**
	 * 将统计数据导出,并进行加密操作
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	public ActionForward exportUnitsData(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		Authorization auth = (Authorization) request.getSession(true)
				.getAttribute("authorization");
		if (auth == null || auth.getUserid() == 0) {
			PrintWriter out = response.getWriter();
			out.print("<script>top.location.href='"+request.getContextPath()+"/default.jsp';</script>");

		} 
		String startdate = request.getParameter("startdate");		
		String enddate = request.getParameter("enddate");		
		java.util.List<BaFlight> list = null;
		BaFlightKeyWord keyword = new BaFlightKeyWord();
		//航程的list
		list = new FlightService().queryBaFlight(keyword);		
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setStartDate(startdate +" 00:00:00");
		kw.setEndDate(enddate + " 23:59:59");		
		int count = 0;
		Map<String,List<OpOrdertickets>> map = new HashMap<String,List<OpOrdertickets>> ();
		for(BaFlight bf:list){
			kw.setSeleFlightId(bf.getId());
			map.put("unitsIfno"+count, service.getAllCountInfoForUnits(kw));
			count++;
		}
		ExcelOpUnit.exportExcel(list,map,(startdate+"至"+enddate).replaceAll("-", ""),request,response);
		return null;
		
	}
	
	/**
	 * 将统计数据导出,并进行加密操作
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	public ActionForward exportByYear(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		Authorization auth = (Authorization) request.getSession(true)
				.getAttribute("authorization");
		if (auth == null || auth.getUserid() == 0) {
			PrintWriter out = response.getWriter();
			out.print("<script>top.location.href='"+request.getContextPath()+"/default.jsp';</script>");

		} 
		String year = request.getParameter("year");			
		java.util.List<BaFlight> list = null;
		BaFlightKeyWord keyword = new BaFlightKeyWord();
		//航程的list
		list = new FlightService().queryBaFlight(keyword);		
		ClienService service = new ClienService();
		Map<String,List<OrderTicketUnitBean>> map = new HashMap<String,List<OrderTicketUnitBean>> ();
		/**
		 * 获得航程ids， 通过航程id再获得当年的所有航班id，通过当年的航班id再进行统计工作
		 */
		for(BaFlight bf:list){
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setYear(Integer.valueOf(year));
			kw.setFlightId(bf.getId());
			List<OpOrdertickets> flightInfoIdList = service.getFlightInfoIdsByYearAndFlightID(kw);
			List<OrderTicketUnitBean> resultslist = new ArrayList<OrderTicketUnitBean> ();
			
			for(OpOrdertickets op:flightInfoIdList){
				OpOrderticketsKeyword kw1 = new OpOrderticketsKeyword();
				kw1.setSeleFlightInfo(op.getId());
				List<OpOrdertickets> opList = service.getThreeCounts(kw1);
				OrderTicketUnitBean rowsData = new OrderTicketUnitBean();
				rowsData = this.initRowsData(rowsData);
				rowsData.setFlight(bf.getFlight());
				rowsData.setMonth(op.getMonth());
				rowsData.setDay(op.getDay());
				double priceCount = 0;
				long personCount = 0;
				if(opList!=null && opList.size() > 0){
					for(OpOrdertickets priceTypeOp:opList){
						String discountType = priceTypeOp.getDiscountType();//票价类型
						Float realAmount = priceTypeOp.getRealAmount();//票价
						Integer counts = priceTypeOp.getCounts();//张数
						personCount += counts;
						priceCount = priceCount + (realAmount*counts);
						int i = 0;
						i = getTypeByName(discountType);
						switch (i) {
						case 0:
							rowsData.setAllPrice(realAmount);
							rowsData.setAllPriceCount(counts+0L);
							break;
						case 1:	
							rowsData.setSoldierPrice(realAmount);
							rowsData.setSoldierPriceCount(counts+0L);
							break;
						case 2:
							rowsData.setEightPrice(realAmount);
							rowsData.setEightPriceCount(counts+0L);
							break;
						case 3:	
							rowsData.setFivePrice(realAmount);
							rowsData.setFivePriceCount(counts+0L);
							break;
						case 4:		
							rowsData.setChildrenFivePrice(realAmount);
							rowsData.setChildrenFivePriceCount(counts+0L);
							break;
						case 5:	
							rowsData.setBabyPrice(realAmount);
							rowsData.setBabyPriceCount(counts+0L);
							break;
						case 6:	
							rowsData.setOverallPrice(realAmount);
							rowsData.setOverallPriceCount(counts+0L);
							break;						
						}
					}
				}
				rowsData.setPersonCount(personCount);//小计人数
				rowsData.setPriceCount(priceCount);//小计价格
				if(personCount==0){
					continue;
				}
				resultslist.add(rowsData);
			}
			
			map.put(bf.getId()+"", resultslist);
		}
		ExcelOpUnit.exportExcelYear(list,map,year,request,response);
		return null;
		
	} 
	private static  int getTypeByName(String discountType){
		int k = -1;
		if(discountType.contains("全价")){
			k = 0;
		}else if(discountType.contains("军人")){
			k = 1;
		}else if(discountType.contains("八折")){
			k = 2;
		}else if(discountType.contains("儿童")){
			k = 4;
		}else if(discountType.contains("五折")){
			k = 3;
		}else if(discountType.contains("一折")){
			k = 5;
		}else if(discountType.contains("免票")){
			k = 6;
		}
		return k;
	}
	/**
	 * 初始化票价
	 * @param rowsData
	 * @return
	 */
	private OrderTicketUnitBean initRowsData(OrderTicketUnitBean rowsData){
		rowsData.setAllPrice(0.0F);
		rowsData.setAllPriceCount(0L);
		rowsData.setBabyPrice(0.0F);
		rowsData.setBabyPriceCount(0L);
		rowsData.setChildrenFivePrice(0.0F);
		rowsData.setChildrenFivePriceCount(0l);
		rowsData.setEightPrice(0.0F);
		rowsData.setEightPriceCount(0L);
		rowsData.setFivePrice(0.0F);
		rowsData.setFivePriceCount(0L);
		rowsData.setOverallPrice(0F);
		rowsData.setOverallPriceCount(0L);
		rowsData.setSoldierPrice(0F);
		rowsData.setSoldierPriceCount(0L);		
		rowsData.setPersonCount(0L);		
		rowsData.setPriceCount(0.00D);
		return rowsData;
		
	}
	/**
	 * 将统计数据导出,并进行加密操作
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	public ActionForward exceptionUnits(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		Authorization auth = (Authorization) request.getSession(true)
				.getAttribute("authorization");
		if (auth == null || auth.getUserid() == 0) {
			PrintWriter out = response.getWriter();
			out.print("<script>top.location.href='"+request.getContextPath()+"/default.jsp';</script>");

		} 
		
			
		    String startdate = request.getParameter("startdate");
		    request.setAttribute("startdate",startdate);
		    String enddate = request.getParameter("enddate");
		    request.setAttribute("enddate",enddate);
		    ClienService service = new ClienService();
		    OpOrderticketsKeyword keyWord = new OpOrderticketsKeyword();		    
		    keyWord.setStartDate(startdate);
		    keyWord.setEndDate(enddate);
			List<OpOrdertickets> list = service.zhidengjiticketsListForException(keyWord);			
			request.setAttribute("list", list);			
			return mapping.findForward("exceptionDatas");
		}
}
