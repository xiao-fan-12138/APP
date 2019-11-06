package	cn.smbms.pojo;
import java.util.Date;
public class App_category {
	private Integer id;
	private String categoryCode;
	private String categoryName;
	private Integer parentId;
	private Integer createdBy;
	private Date creationTime;
	private Integer modifyBy;
	private Date modifyDate;
	public void setId(Integer id){
		this.id = id;
	}
	public Integer getId(){
		return id;
	}
	public void setCategoryCode(String categoryCode){
		this.categoryCode = categoryCode;
	}
	public String getCategoryCode(){
		return categoryCode;
	}
	public void setCategoryName(String categoryName){
		this.categoryName = categoryName;
	}
	public String getCategoryName(){
		return categoryName;
	}
	public void setParentId(Integer parentId){
		this.parentId = parentId;
	}
	public Integer getParentId(){
		return parentId;
	}
	public void setCreatedBy(Integer createdBy){
		this.createdBy = createdBy;
	}
	public Integer getCreatedBy(){
		return createdBy;
	}
	public void setCreationTime(Date creationTime){
		this.creationTime = creationTime;
	}
	public Date getCreationTime(){
		return creationTime;
	}
	public void setModifyBy(Integer modifyBy){
		this.modifyBy = modifyBy;
	}
	public Integer getModifyBy(){
		return modifyBy;
	}
	public void setModifyDate(Date modifyDate){
		this.modifyDate = modifyDate;
	}
	public Date getModifyDate(){
		return modifyDate;
	}
}
