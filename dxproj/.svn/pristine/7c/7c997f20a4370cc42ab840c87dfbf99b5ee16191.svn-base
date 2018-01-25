package com.founder.enp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.upload.FormFile;

import com.founder.enp.entity.Parameter;
import com.founder.enp.entity.Template;
import com.founder.enp.entity.TemplateKeyWord;
import com.founder.enp.iface.TemplateDao;
import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;

public class TemplateService {

	private static Log log = LogFactory.getLog(DepartMentService.class);

	private DaoManager daoMgr;

	private TemplateDao dao;

	public TemplateService() {
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (TemplateDao) daoMgr.getDao(TemplateDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}

	}

	public boolean add(Template template) {
		try {
			dao.add(template);
			return true;
		} catch (Exception ex) {
			log.error("添加模板错误" + ex.getMessage());
			return false;
		}
	}

	public List getAllTemplate()
	{
		try
		{
			return dao.getAllTemplate();
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return null;
		}
	}
	public int queryTemplateCount(TemplateKeyWord keyword) {
		try {
			return dao.queryTemplateCount(keyword);

		} catch (Exception ex) {
			log.error("查询模板错误" + ex.getMessage());
			return -1;
		}
	}

	public Template selectTemplate(int templateid) {
		try {
			return dao.selectTemplate(templateid);

		} catch (Exception ex) {
			log.error("查询模板错误" + ex.getMessage());
			return null;
		}
	}

	public List listTemplate(TemplateKeyWord keyword) {
		try {
			return dao.listTemplate(keyword);
		} catch (Exception ex) {
			log.error("查询模板错误" + ex.getMessage());
			return null;
		}
	}

	public boolean update(Template template) {
		try {
			dao.update(template);
			return true;
		} catch (Exception ex) {
			log.error("更新模板错误" + ex.getMessage());
			return false;
		}
	}

	public int delete(String idString) {
		
		
		java.util.StringTokenizer token = new java.util.StringTokenizer(
				idString, ";");
		try {
			while (token.hasMoreTokens()) {
				if (dao.isDel(Integer.parseInt(token.nextToken())) > 1)
					return 2;
			}
			token = new java.util.StringTokenizer(idString, ";");
			ParameterService service = new ParameterService();
			Parameter param = service.listParameter();
		
			daoMgr.startTransaction();
			while (token.hasMoreTokens()) {
				int id = Integer.parseInt(token.nextToken());
				Template template = selectTemplate(id);
				File file = new File(param.getTemplateip()+template.getFilename());
				file.delete();
				dao.delete(id);
			}
			daoMgr.commitTransaction();
			return 1;
		} catch (Exception ex) {
			
			log.error(ex.getMessage());
			return 0;

		}
		finally
		{
			daoMgr.endTransaction();
		}
	}

	public boolean chekcName(String name) {
		try {
			if (dao.checkName(name) > 0)
				return true;
			else
				return false;
		} catch (Exception ex) {
			log.error(ex.getMessage());
			return false;
		}
	}

	public String upload(FormFile file, String fileName) {
		ParameterService service = new ParameterService();
		Parameter param = service.listParameter();
		if (param == null)
			return "";
		String destPath = param.getTemplateip();
		String ofn = file.getFileName();
		fileName = fileName + ofn.substring(ofn.lastIndexOf("."), ofn.length());
		UploadFile upload = new UploadFile(destPath, fileName, file);
		try {
			upload.upload();
			return fileName;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.error("上传模板失败" + e.getMessage());
			return "";
		}

	}

}
