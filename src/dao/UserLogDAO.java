package dao;

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import entitys.UserLog;
import entitys.Users;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserLog entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see entitys.UserLog
 * @author MyEclipse Persistence Tools
 */

public class UserLogDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(UserLogDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String DOCUMENTS_ID = "documentsId";
	public static final String OPERATE = "operate";
	public static final String TYPE = "type";
	public static final String UD0 = "ud0";
	public static final String UD1 = "ud1";
	public static final String UD2 = "ud2";
	public static final String UD3 = "ud3";
	public static final String UD4 = "ud4";

	public void save(UserLog transientInstance) {
		log.debug("saving UserLog instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void update(UserLog transientInstance) {
		log.debug("updating UserLog instance");
		try {
			getHibernateTemplate().update(transientInstance);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}

	public void delete(UserLog persistentInstance) {
		log.debug("deleting UserLog instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserLog findById(java.lang.Integer id) {
		log.debug("getting UserLog instance with id: " + id);
		try {
			UserLog instance = (UserLog) getHibernateTemplate().get(UserLog.class, id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<UserLog> findByExample(UserLog instance) {
		log.debug("finding UserLog instance by example");
		try {
			List<UserLog> results = (List<UserLog>) getSession()
					.createCriteria(UserLog.class).add(create(instance)).list();
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
		log.debug("finding UserLog instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UserLog as model where model."
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

	public List<UserLog> findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List<UserLog> findByDocumentsId(Object documentsId) {
		return findByProperty(DOCUMENTS_ID, documentsId);
	}

	public List<UserLog> findByOperate(Object operate) {
		return findByProperty(OPERATE, operate);
	}

	public List<UserLog> findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List<UserLog> findByUd0(Object ud0) {
		return findByProperty(UD0, ud0);
	}

	public List<UserLog> findByUd1(Object ud1) {
		return findByProperty(UD1, ud1);
	}

	public List<UserLog> findByUd2(Object ud2) {
		return findByProperty(UD2, ud2);
	}

	public List<UserLog> findByUd3(Object ud3) {
		return findByProperty(UD3, ud3);
	}

	public List<UserLog> findByUd4(Object ud4) {
		return findByProperty(UD4, ud4);
	}

	public List findAll() {
		log.debug("finding all UserLog instances");
		try {
			String queryString = "from UserLog ";
			Query queryObject = getSession().createQuery(queryString);
			getSession().close();
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserLog merge(UserLog detachedInstance) {
		log.debug("merging UserLog instance");
		try {
			UserLog result = (UserLog) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserLog instance) {
		log.debug("attaching dirty UserLog instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserLog instance) {
		log.debug("attaching clean UserLog instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public List findByLikeName(String name) {
		// TODO Auto-generated method stub
		name="%"+name+"%";
		log.debug("finding UserLog instance with property: " + NAME
				+ ", value: " + name);
		try {
			String queryString = "from UserLog as model where model."
					+ NAME + " like '"+name+"' order by Id desc";
			Query queryObject = getSession().createQuery(queryString);
			getSession().close();
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}