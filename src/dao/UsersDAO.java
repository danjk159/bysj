package dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;

import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import entitys.Users;

/**
 * A data access object (DAO) providing persistence and search support for Users
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see entitys.Users
 * @author MyEclipse Persistence Tools
 */

public class UsersDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(UsersDAO.class);
	// property constants
	public static final String PASSWORD = "password";
	public static final String EMAIL = "email";
	public static final String ROLES = "roles";
	public static final String REAL_NAME = "realName";
	public static final String SEX = "sex";
	public static final String WORK = "work";
	public static final String INTEREST = "interest";
	public static final String CITY = "city";
	public static final String UD0 = "ud0";
	public static final String UD1 = "ud1";
	public static final String UD2 = "ud2";
	public static final String UD3 = "ud3";
	public static final String UD4 = "ud4";

	public void save(Users transientInstance) {
		log.debug("saving Users instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Users persistentInstance) {
		log.debug("deleting Users instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Users findById(java.lang.String id) {
		log.debug("getting Users instance with id: " + id);
		try {
			Users instance = (Users) getHibernateTemplate().get(Users.class, id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List findByLikeId(java.lang.String id) {
		id="%"+id+"%";
		log.debug("finding Users instance with property: Name" 
				+ ", value: " + id);
		try {
			String queryString = " from Users as model where model.name like '"+id+"' and Roles<>1";
			Query queryObject = getSession().createQuery(queryString);
			getSession().close();
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Users> findByExample(Users instance) {
		log.debug("finding Users instance by example");
		try {
			List<Users> results = (List<Users>) getSession()
					.createCriteria(Users.class).add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			getSession().close();
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Users instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Users as model where model."
					+ propertyName + "= ?";
			
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			getSession().close();
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Users> findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List<Users> findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List<Users> findByRoles(Object roles) {
		return findByProperty(ROLES, roles);
	}

	public List<Users> findByRealName(Object realName) {
		return findByProperty(REAL_NAME, realName);
	}

	public List<Users> findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List<Users> findByWork(Object work) {
		return findByProperty(WORK, work);
	}

	public List<Users> findByInterest(Object interest) {
		return findByProperty(INTEREST, interest);
	}

	public List<Users> findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List<Users> findByUd0(Object ud0) {
		return findByProperty(UD0, ud0);
	}

	public List<Users> findByUd1(Object ud1) {
		return findByProperty(UD1, ud1);
	}

	public List<Users> findByUd2(Object ud2) {
		return findByProperty(UD2, ud2);
	}

	public List<Users> findByUd3(Object ud3) {
		return findByProperty(UD3, ud3);
	}

	public List<Users> findByUd4(Object ud4) {
		return findByProperty(UD4, ud4);
	}

	public List findAll() {
		log.debug("finding all Users instances");
		try {
			String queryString = "from Users";
			Query queryObject = getSession().createQuery(queryString);
			getSession().close();
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Users merge(Users detachedInstance) {
		log.debug("merging Users instance");
		try {
			Users result = (Users) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Users instance) {
		log.debug("attaching dirty Users instance");
		try {
			Session session=getSession();
			session.saveOrUpdate(instance);
			session.close();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	public void Update(Users instance) {
		log.debug("attaching dirty Users instance");
		try {
			getHibernateTemplate().update(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	public void attachClean(Users instance) {
		log.debug("attaching clean Users instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	public pageBean.User findUserAsPage(String id)
	{
		List list=findByLikeId(id);
		ArrayList arrayList = new ArrayList(list);
		pageBean.User user=new pageBean.User(arrayList,"" );
		return user;
	}
	

}