package entitys;

import java.text.DateFormat;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.GenericGenerator;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Users", catalog = "ShareDocuments", uniqueConstraints = @UniqueConstraint(columnNames = "Email"))
public class Users implements java.io.Serializable {

	// Fields

	private String name;
	private String password;
	private String email;
	private Integer roles=0;
	private String realName;
	private Integer sex;
	private Date birthday;
	private String work;
	private String interest;
	private String city;
	private String ud0;
	private String ud1;
	private String ud2;
	private String ud3;
	private String ud4;

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String password, String email, Integer roles, String realName) {
		this.password = password;
		this.email = email;
		this.roles = roles;
		this.realName = realName;
	}

	/** full constructor */
	public Users(String password, String email, Integer roles, String realName,
			Integer sex, Date birthday, String work, String interest,
			String city, String ud0, String ud1, String ud2, String ud3,
			String ud4) {
		this.password = password;
		this.email = email;
		this.roles = roles;
		this.realName = realName;
		this.sex = sex;
		this.birthday = birthday;
		this.work = work;
		this.interest = interest;
		this.city = city;
		this.ud0 = ud0;
		this.ud1 = ud1;
		this.ud2 = ud2;
		this.ud3 = ud3;
		this.ud4 = ud4;
	}

	// Property accessors
	@Id
	//下面两行设置主键生成方式，设为外部值使用
	@GeneratedValue(generator = "paymentableGenerator")     
	@GenericGenerator(name = "paymentableGenerator", strategy = "assigned") 
	@Column(name = "Name", unique = true, nullable = false, length = 32 )
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Password", nullable = false, length = 32)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "Email", unique = true, nullable = false, length = 32)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Roles", nullable = false)
	public Integer getRoles() {
		return this.roles;
	}

	public void setRoles(Integer roles) {
		this.roles = roles;
	}

	@Column(name = "RealName", nullable = false, length = 32)
	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(name = "Sex")
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "Birthday", length = 10)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "Work", length = 16)
	public String getWork() {
		return this.work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	@Column(name = "Interest", length = 32)
	public String getInterest() {
		return this.interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	@Column(name = "City", length = 32)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
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