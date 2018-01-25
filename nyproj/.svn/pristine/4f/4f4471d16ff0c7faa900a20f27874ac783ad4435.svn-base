package com.founder.enp.iface;

import java.util.List;

import com.founder.enp.entity.GpReleation;
import com.founder.enp.entity.UserGroup;



public interface UserGroupDao {
	
	public abstract void add(UserGroup ug);
	public abstract List queryDpmUg(int id);
	public abstract UserGroup queryUgInfo(int id);
	public abstract void edit(UserGroup ug);
	public abstract void updatePowers(GpReleation releation);
	public abstract int isHaveUser(int groupid);
	public abstract void deleteUg(int groupid);
	public abstract void deleteGpReleation(int groupid);
	public abstract List queryPowersInfo(int groupid);

	public  List seleQXSystem(int groupid);
}
