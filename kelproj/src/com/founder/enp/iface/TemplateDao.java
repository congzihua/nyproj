package com.founder.enp.iface;

import java.util.List;

import com.founder.enp.entity.Template;
import com.founder.enp.entity.TemplateKeyWord;
import com.ibatis.dao.client.Dao;

public interface TemplateDao extends Dao {
	
	public abstract void add(Template template);
	public abstract int queryTemplateCount(TemplateKeyWord keyword);
	public abstract List listTemplate(TemplateKeyWord keyword);
	public abstract Template selectTemplate(int templateid);
	public abstract void update(Template template);
	public abstract int checkName(String name);
	public abstract void delete(int templateid);
	public abstract int isDel(int templateid);
	public abstract List getAllTemplate();
}
