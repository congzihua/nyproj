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

import java.io.Reader;
import java.util.Properties;

import com.ibatis.common.resources.Resources;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.DaoManagerBuilder;

public class DaoConfig {

    private static final String resource = "com/founder/enp/persistence/dao.xml";

    private static final DaoManager daoManager;

    static {
        try {
            daoManager = newDaoManager(null);
        } catch (Exception ex) {
            throw new RuntimeException("Description.  Cause: " + ex, ex);
        }
    }

    public static DaoManager getDaoManager() {
        return daoManager;
    }

    public static DaoManager newDaoManager(Properties props) {
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            return DaoManagerBuilder.buildDaoManager(reader, props);
        } catch (Exception ex) {
            throw new RuntimeException(
                    "Could not initialize DaoConfig.  Cause: " + ex, ex);
        }
    }
}
