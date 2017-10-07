package com.lemon.system.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.lemon.base.entity.BaseEntity;

@Entity
@Table(name = "tb_sys_menu", catalog = "lemon")
// @JsonIgnoreProperties(value = {"children"})
public class SysMenu extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 7013653012846613775L;
	private String id;
	private String name;
	private SysMenu parent;
	private Integer level;
	private Integer sort;
	private String href;
	private String target;
	private String icon;
	private Integer isShow;
	private String createUserId;
	private Timestamp createTime;
	private String updateUserId;
	private Timestamp updateTime;
	private String delFlag;
	List<SysMenu> children = new ArrayList<SysMenu>();

	// Constructors

	/** default constructor */
	public SysMenu() {
	}

	// Property accessors
	@Id
	@Column(name = "id", nullable = false, length = 64)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public SysMenu getParent() {
		return parent;
	}

	public void setParent(SysMenu parent) {
		this.parent = parent;
	}

	@Column(name = "name", nullable = false, length = 64)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "level", nullable = false)
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Column(name = "sort", nullable = false)
	public Integer getSort() {
		return this.sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Column(name = "href", length = 1000)
	public String getHref() {
		return this.href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	@Column(name = "target", length = 20)
	public String getTarget() {
		return this.target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	@Column(name = "icon", length = 100)
	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "is_show", nullable = false)
	public Integer getIsShow() {
		return this.isShow;
	}

	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}

	@Column(name = "create_user_id", length = 36)
	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	@Column(name = "create_time", length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name = "update_user_id", length = 36)
	public String getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	@Column(name = "update_time", nullable = false, length = 19)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "del_flag", nullable = false, length = 1)
	public String getDelFlag() {
		return this.delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@OneToMany(targetEntity = SysMenu.class, cascade = CascadeType.ALL, mappedBy = "parent")
	@Fetch(FetchMode.SUBSELECT)
	public List<SysMenu> getChildren() {
		return children;
	}

	public void setChildren(List<SysMenu> children) {
		this.children = children;
	}

	public String toJSON() {

		StringBuffer jsonBuffer = new StringBuffer();
		jsonBuffer.append("{\"menu\":");

		recurJson(this, jsonBuffer);

		jsonBuffer.append("}");

		return jsonBuffer.toString();
	}

	protected StringBuffer recurJson(SysMenu menu, StringBuffer jsonBuffer) {
		jsonBuffer.append("{\"id\":\"" + menu.id + "\",\"name\":\"" + menu.name + "\",\"level\":\"" + menu.level
				+ "\",\"href\":\"" + menu.href + "\",");// ]
		int length = menu.getChildren().size();
		if (menu.getChildren().size() == 0) {
			jsonBuffer.append("\"children\":[]}");
			return jsonBuffer;
		}
		if (length > 0) {
			jsonBuffer.append("\"children\":[");
			for (int i = 0; i < length; i++) {
				recurJson(menu.children.get(i), jsonBuffer);
				if (i < length - 1) {
					jsonBuffer.append(",");
				}
			}
			jsonBuffer.append("]");
		}
		jsonBuffer.append("}");
		return jsonBuffer;
	}
}