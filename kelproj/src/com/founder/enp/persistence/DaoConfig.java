package com.founder.enp.persistence;
/**
* Copyright (c) 2002,
* All rights reserved.
*
*摘要： 
*    基于iBATIS的，根据配置文件创建一个系统级可用的DaoManager
* 当前版本：1.0
* 作者：ligy
* 完成日期：2009-07-4
*/

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import com.ibatis.common.resources.Resources;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.DaoManagerBuilder;

public class DaoConfig {

    private static final String resource = "com/founder/enp/persistence/dao.xml";

    private static final DaoManager daoManager;

    static {
    	daoManager = newDaoManager(null);
    }

    public static DaoManager getDaoManager() {
        return daoManager;
    }

    public static DaoManager newDaoManager(Properties props)  {
    	 Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
         return DaoManagerBuilder.buildDaoManager(reader, props);
    }
}
