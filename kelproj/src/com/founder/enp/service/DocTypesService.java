package com.founder.enp.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.entity.Authorization;
import com.founder.enp.entity.DocNum;
import com.founder.enp.entity.DocTypes;
import com.founder.enp.entity.DocTypesKeyWord;
import com.founder.enp.entity.Watches;
import com.founder.enp.iface.DocTypesDao;
import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;

public class DocTypesService {

	private static Log log = LogFactory.getLog(DepartMentService.class);

	private DaoManager daoMgr;

	private static Integer lock = 0;

	private DocTypesDao dao;

	public DocTypesService() {
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (DocTypesDao) daoMgr.getDao(DocTypesDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	}

	public int queryDocTypesCount(DocTypesKeyWord keyword) {
		try {
			return dao.queryDocTypesCount(keyword);
		} catch (Exception ex) {
			log.error("查询文种类型出错" + ex.getMessage());
			return -1;
		}
	}

	public List listDocTypes(DocTypesKeyWord keyword) {
		try {
			return dao.listDocTypes(keyword);
		} catch (Exception ex) {
			log.error("查询文种类型出错" + ex.getMessage());
			return null;
		}
	}

	public boolean add(DocTypes types) {
		try {

			daoMgr.startTransaction();
			int doctypeid = dao.add(types);
			DocNum docNum = new DocNum();
			docNum.setDoctypeid(doctypeid);
			docNum.setNextnum(1);
			java.text.SimpleDateFormat format = new java.text.SimpleDateFormat(
					"yyyy");
			docNum.setYear(Integer.parseInt(format.format(new Date())));
			dao.insertDocNum(docNum);
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error("新建文种类型出错" + ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public DocTypes getDocTypesInfo(int doctypeid) {
		try {

			return dao.getDocTypesInfo(doctypeid);
		} catch (Exception ex) {
			log.error("查询文种信息出错" + ex.getMessage());
			return null;
		}
	}

	public boolean delete(String idString) {
		java.util.StringTokenizer token = new java.util.StringTokenizer(
				idString, ";");

		try {
			daoMgr.startTransaction();
			int docTypeid;
			while (token.hasMoreTokens()) {
				docTypeid = Integer.parseInt(token.nextToken());
				dao.delete(docTypeid);
				dao.deldocnum(docTypeid);
			}
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error("删除文种信息出错" + ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public boolean edit(DocTypes doctypes) {
		try {

			dao.edit(doctypes);
			return true;
		} catch (Exception ex) {
			log.error("修改文种信息出错" + ex.getMessage());
			return false;
		}
	}

	public List getAllDocTypes() {
		try {

			return dao.getAllDoctypes();

		} catch (Exception ex) {
			log.error("获取文种信息出错" + ex.getMessage());
			return null;
		}
	}

	public DocNum getDocSynchornizedNum(int doctypeid,HttpServletRequest request) {
		try {

			daoMgr.startTransaction();
			if (dao.checkGetDocNum(doctypeid) > 0)
				return null;
			synchronized (lock) {
				DocNum docNum = dao.getDocNum(doctypeid);
				java.text.SimpleDateFormat format = new java.text.SimpleDateFormat(
						"yyyy");
				String year = format.format(new Date());
				
				if (!(String.valueOf(docNum.getYear()).equals(year))) {
					docNum.setYear(Integer.parseInt(year));
					docNum.setNextnum(1);
					saveDocNum(docNum);
				}
				Authorization authorization = (Authorization) request.getSession()
				.getAttribute("authorization");
				Watches watches = new Watches();
				watches.setUserid(authorization.getUserid());
				watches.setDoctypeid(doctypeid);
				UserService service = new UserService();
				service.updateDocNumLock(watches);
				
				daoMgr.commitTransaction();
				return docNum;
			}
		

		} catch (Exception ex) {
			log.error("获取文种文号信息出错" + ex.getMessage());
			return null;
		}
		finally
		{
			daoMgr.endTransaction();
		}
	}

	public DocNum getDocNum(int doctypeid) {
		try {
			return dao.getDocNum(doctypeid);

		} catch (Exception ex) {
			log.error("获取文种文号信息出错" + ex.getMessage());
			return null;
		}
	}

	public boolean saveDocNum(DocNum docNum) {
		try {

			synchronized (lock) {
				dao.updateDocNum(docNum);
			}
			return true;

		} catch (Exception ex) {
			log.error("更新文种文号信息出错" + ex.getMessage());
			return false;
		}
	}

	public List getDocTypesFromDmp(int dmpid) {
		try {

			return dao.getDocTypesFromDmp(dmpid);

		} catch (Exception ex) {
			log.error("获取部门文种信息出错" + ex.getMessage());
			return null;
		}
	}

	public Integer getDocIDFromDocTypeName(String typename) {
		try {

			return dao.getDocIDFromDocTypeName(typename);

		} catch (Exception ex) {
			log.error("获取文种信息出错" + ex.getMessage());
			return null;
		}
	}
}
