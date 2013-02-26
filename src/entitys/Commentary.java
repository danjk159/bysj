package entitys;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Commentary entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Commentary", catalog = "ShareDocuments")
public class Commentary implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer documentsId;
	private Date operateTime;
	private String context;
	private Integer recommendation;
	private String ud0;
	private String ud1;
	private String ud2;
	private String ud3;
	private String ud4;

	// Constructors

	/** default constructor */
	public Commentary() {
	}

	/** minimal constructor */
	public Commentary(String name, Integer documentsId, Date operateTime) {
		this.name = name;
		this.documentsId = documentsId;
		this.operateTime = operateTime;
	}

	/** full constructor */
	public Commentary(String name, Integer documentsId, Date operateTime,
			String context, Integer recommendation, String ud0, String ud1,
			String ud2, String ud3, String ud4) {
		this.name = name;
		this.documentsId = documentsId;
		this.operateTime = operateTime;
		this.context = context;
		this.recommendation = recommendation;
		this.ud0 = ud0;
		this.ud1 = ud1;
		this.ud2 = ud2;
		this.ud3 = ud3;
		this.ud4 = ud4;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "Id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "Name", nullable = false, length = 32)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "DocumentsId", nullable = false)
	public Integer getDocumentsId() {
		return this.documentsId;
	}

	public void setDocumentsId(Integer documentsId) {
		this.documentsId = documentsId;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "OperateTime", nullable = false, length = 10)
	public Date getOperateTime() {
		return this.operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	@Column(name = "Context", length = 65535)
	public String getContext() {
		return this.context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	@Column(name = "Recommendation")
	public Integer getRecommendation() {
		return this.recommendation;
	}

	public void setRecommendation(Integer recommendation) {
		this.recommendation = recommendation;
	}

	@Column(name = "UD0", length = 64)
	public String getUd0() {
		return this.ud0;
	}

	public void setUd0(String ud0) {
		this.ud0 = ud0;
	}

	@Column(name = "UD1", length = 64)
	public String getUd1() {
		return this.ud1;
	}

	public void setUd1(String ud1) {
		this.ud1 = ud1;
	}

	@Column(name = "UD2", length = 64)
	public String getUd2() {
		return this.ud2;
	}

	public void setUd2(String ud2) {
		this.ud2 = ud2;
	}

	@Column(name = "UD3", length = 64)
	public String getUd3() {
		return this.ud3;
	}

	public void setUd3(String ud3) {
		this.ud3 = ud3;
	}

	@Column(name = "UD4", length = 64)
	public String getUd4() {
		return this.ud4;
	}

	public void setUd4(String ud4) {
		this.ud4 = ud4;
	}

}