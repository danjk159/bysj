package dao;

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import entitys.Commentary;
import entitys.Documents;

/**
 * A data access object (DAO) providing persistence and search support for
 * Documents entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see entitys.Documents
 * @author MyEclipse Persistence Tools
 */

public class DocumentsDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(DocumentsDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String AUTHOR = "author";
	public static final String CONTENTS = "contents";
	public static final String VIEWS = "views";
	public static final String IMAGE = "image";
	public static final String UD0 = "ud0";
	public static final String UD1 = "ud1";
	public static final String UD2 = "ud2";
	public static final String UD3 = "ud3";
	public static final String UD4 = "ud4";

	public void save(Documents transientInstance) {
		log.debug("saving Documents instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
			getSession().close();
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void update(Documents transientInstance) {
		log.debug("updating Documents instance");
		try {
			getHibernateTemplate().update(transientInstance);
			log.debug("update successful");
			getSession().close();
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}
	
	public void delete(Documents persistentInstance) {
		log.debug("deleting Documents instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Documents findById(java.lang.Integer id) {
		log.debug("getting Documents instance with id: " + id);
		try {
			Documents instance = (Documents) getHibernateTemplate().get(Documents.class,id);
			getSession().close();
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Documents> findByExample(Documents instance) {
		log.debug("finding Documents instance by example");
		try {
			List<Documents> results = (List<Documents>) getSession()
					.createCriteria(Documents.class).add(create(instance))
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
		log.debug("finding Documents instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Documents as model where model."
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

	public List<Documents> findByName(Object name) {
		return findByProperty(NAME, name);
	}
	
	public List findByLikeName(Object name) {
		if(name==null){
			name="%%";
		}
		else{
		name="%"+name+"%";
		}
		log.debug("finding Documents instance with property: " + NAME
				+ ", value: " + name);
		try {
			String queryString = "from Documents as model where model."
					+ NAME + " like '"+name+"'";
			Query queryObject = getSession().createQuery(queryString);
			getSession().close();
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Documents> findByAuthor(Object author) {
		return findByProperty(AUTHOR, author);
	}

	public List<Documents> findByContents(Object contents) {
		return findByProperty(CONTENTS, contents);
	}

	public List<Documents> findByViews(Object views) {
		return findByProperty(VIEWS, views);
	}

	public List<Documents> findByImage(Object image) {
		return findByProperty(IMAGE, image);
	}

	public List<Documents> findByUd0(Object ud0) {
		return findByProperty(UD0, ud0);
	}

	public List<Documents> findByUd1(Object ud1) {
		return findByProperty(UD1, ud1);
	}

	public List<Documents> findByUd2(Object ud2) {
		return findByProperty(UD2, ud2);
	}

	public List<Documents> findByUd3(Object ud3) {
		return findByProperty(UD3, ud3);
	}

	public List<Documents> findByUd4(Object ud4) {
		return findByProperty(UD4, ud4);
	}

	public List findAll() {
		log.debug("finding all Documents instances");
		try {
			String queryString = "from Documents";
			Query queryObject = getSession().createQuery(queryString);
			getSession().close();
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Documents merge(Documents detachedInstance) {
		log.debug("merging Documents instance");
		try {
			Documents result = (Documents) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Documents instance) {
		log.debug("attaching dirty Documents instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Documents instance) {
		log.debug("attaching clean Documents instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}