package entitys;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Documents entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Documents", catalog = "ShareDocuments", uniqueConstraints = @UniqueConstraint(columnNames = "Name"))
public class Documents implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String author;
	private Date date;
	private String contents;
	private Integer views;
	private String image;
	private String ud0;
	private String ud1;
	private String ud2;
	private String ud3;
	private String ud4;

	// Constructors

	/** default constructor */
	public Documents() {
	}

	/** minimal constructor */
	public Documents(String name, Date date, Integer views) {
		this.name = name;
		this.date = date;
		this.views = views;
	}

	/** full constructor */
	public Documents(String name, String author, Date date, String contents,
			Integer views, String image, String ud0, String ud1, String ud2,
			String ud3, String ud4) {
		this.name = name;
		this.author = author;
		this.date = date;
		this.contents = contents;
		this.views = views;
		this.image = image;
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

	@Column(name = "Name", unique = true, nullable = false, length = 64)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Author", length = 32)
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Date", nullable = false)
	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Column(name = "Contents", length = 65535)
	public String getContents() {
		return this.contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Column(name = "Views", nullable = false)
	public Integer getViews() {
		return this.views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	@Column(name = "Image", length = 64)
	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
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