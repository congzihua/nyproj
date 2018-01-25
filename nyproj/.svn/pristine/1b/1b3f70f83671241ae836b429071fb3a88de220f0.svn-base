package com.founder.enp.entity;

import com.founder.enp.persistence.PaginatedModel;

public class UserKeyWord extends PaginatedModel{
	
	    private String userName;
	    private Integer dmpid;
	    private Integer userid;
		public Integer getDmpid() {
			return dmpid;
		}
		public void setDmpid(Integer dmpid) {
			this.dmpid = dmpid;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		@Override
		public int hashCode() {
			final int PRIME = 31;
			int result = 1;
			result = PRIME * result + ((dmpid == null) ? 0 : dmpid.hashCode());
			result = PRIME * result + ((userName == null) ? 0 : userName.hashCode());
			return result;
		}
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			final UserKeyWord other = (UserKeyWord) obj;
			if (dmpid == null) {
				if (other.dmpid != null)
					return false;
			} else if (!dmpid.equals(other.dmpid))
				return false;
			if (userName == null) {
				if (other.userName != null)
					return false;
			} else if (!userName.equals(other.userName))
				return false;
			return true;
		}
		public Integer getUserid() {
			return userid;
		}
		public void setUserid(Integer userid) {
			this.userid = userid;
		}

}
