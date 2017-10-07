package com.lemon.system.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.lemon.base.entity.BaseEntity;

@Entity
@Table(name = "tb_sys_user", catalog = "lemon")
public class SysUser extends BaseEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1744507226769306701L;

	@Id
	@Column(name = "id", nullable = false, length = 36)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String id;
	@Column(name = "login_name", length = 32)
	private String loginName;
	@Column(name = "login_pass", length = 32)
	private String loginPass;
	@Column(name = "user_name", length = 64)
	private String userName;
	@Column(name = "sex", length = 2)
	private String sex;
	@Column(name = "age", length = 3)
	private int age;
	@Column(name = "mobile", length = 11)
	private String mobile;
	@Column(name = "phone", length = 12)
	private String phone;
	@Column(name = "photo", length = 1024)
	private String photo;
	@Column(name = "user_type", length = 2)
	private String userType;
	@Column(name = "login_date", length = 19)
	private Timestamp loginDate;
	@Column(name = "weixin_openid", length = 64)
	private String weixinOpenid;
	@Column(name = "qq_openid", length = 64)
	private String qqOpenid;
	@Column(name = "weibo_uid", length = 64)
	private String weiboUid;
	@Column(name = "user_status", length = 2)
	private int userStatus;
	@Column(name = "org_id", length = 36)
	private String ordId;
	@Column(name = "create_user_id", length = 64)
	private String createUserId;
	@Column(name = "create_time", length = 19)
	private Timestamp createTime;
	@Column(name = "update_user_id", length = 64)
	private String updateUserId;
	@Column(name = "update_time", length = 19)
	private Timestamp updateTime;
	@Column(name = "del_flag", length = 1)
	private String delFlag;

	public SysUser() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPass() {
		return loginPass;
	}

	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Timestamp getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Timestamp loginDate) {
		this.loginDate = loginDate;
	}

	public String getWeixinOpenid() {
		return weixinOpenid;
	}

	public void setWeixinOpenid(String weixinOpenid) {
		this.weixinOpenid = weixinOpenid;
	}

	public String getQqOpenid() {
		return qqOpenid;
	}

	public void setQqOpenid(String qqOpenid) {
		this.qqOpenid = qqOpenid;
	}

	public String getWeiboUid() {
		return weiboUid;
	}

	public void setWeiboUid(String weiboUid) {
		this.weiboUid = weiboUid;
	}

	public int getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}

	public String getOrdId() {
		return ordId;
	}

	public void setOrdId(String ordId) {
		this.ordId = ordId;
	}

	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

}
