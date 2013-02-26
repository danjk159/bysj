package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import entitys.Commentary;

/**
 * A data access object (DAO) providing persistence and search support for
 * Commentary entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see entitys.Commentary
 * @author MyEclipse Persistence Tools
 */

public class CommentaryDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(CommentaryDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String DOCUMENTS_ID = "documentsId";
	public static final String CONTEXT = "context";
	public static final String RECOMMENDATION = "recommendation";
	public static final String UD0 = "ud0";
	public static final String UD1 = "ud1";
	public static final String UD2 = "ud2";
	public static final String UD3 = "ud3";
	public static final String UD4 = "ud4";

	public void save(Commentary transientInstance) {
		log.debug("saving Commentary instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void update(Commentary transientInstance) {
		log.debug("saving Commentary instance");
		try {
			getHibernateTemplate().update(transientInstance);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}
	
	public void delete(Commentary persistentInstance) {
		log.debug("deleting Commentary instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Commentary findById(java.lang.Integer id) {
		log.debug("getting Commentary instance with id: " + id);
		try {
			Commentary instance = (Commentary) getHibernateTemplate().get(Commentary.class, id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Commentary> findByExample(Commentary instance) {
		log.debug("finding Commentary instance by example");
		try {
			List<Commentary> results = (List<Commentary>) getSession()
					.createCriteria(Commentary.class).add(create(instance))
					.list();
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
		log.debug("finding Commentary instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Commentary as model where model."
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

	public List<Commentary> findByName(Object name) {
		return findByProperty(NAME, name);
	}
	
	public List<Commentary> findByLikeName(Object name) {
		name="'%"+name+"%'";
		log.debug("finding Commentary instance with property: " + NAME
				+ ", value: " + name);
		try {
			String queryString = "from Commentary as model where model."
					+ NAME + " like "+name;
			Query queryObject = getSession().createQuery(queryString);
			getSession().close();
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Commentary> findByDocumentsId(Object documentsId) {
		return findByProperty(DOCUMENTS_ID, documentsId);
	}

	public List<Commentary> findByContext(Object context) {
		return findByProperty(CONTEXT, context);
	}

	public List<Commentary> findByRecommendation(Object recommendation) {
		return findByProperty(RECOMMENDATION, recommendation);
	}

	public List<Commentary> findByUd0(Object ud0) {
		return findByProperty(UD0, ud0);
	}

	public List<Commentary> findByUd1(Object ud1) {
		return findByProperty(UD1, ud1);
	}

	public List<Commentary> findByUd2(Object ud2) {
		return findByProperty(UD2, ud2);
	}

	public List<Commentary> findByUd3(Object ud3) {
		return findByProperty(UD3, ud3);
	}

	public List<Commentary> findByUd4(Object ud4) {
		return findByProperty(UD4, ud4);
	}

	public List findAll() {
		log.debug("finding all Commentary instances");
		try {
			String queryString = "from Commentary";
			Query queryObject = getSession().createQuery(queryString);
			getSession().close();
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Commentary merge(Commentary detachedInstance) {
		log.debug("merging Commentary instance");
		try {
			Commentary result = (Commentary) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Commentary instance) {
		log.debug("attaching dirty Commentary instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Commentary instance) {
		log.debug("attaching clean Commentary instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}