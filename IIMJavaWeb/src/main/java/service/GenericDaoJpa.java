package service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class GenericDaoJpa<T> implements GenericDao<T> {

    private final Class<T> type;
    protected EntityManager em;

    public GenericDaoJpa(Class<T> type) {
        super();
        this.type = type;
    }

    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }

    @Transactional(readOnly = true)
    @Override
    public T get(Long id) {
        T entity = this.em.find(this.type, id);
        return entity;
    }

    @Transactional(readOnly = true)
    @Override
    public List<T> findAll() {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<T> criteria = cb.createQuery(type);
        criteria.from(type);
        TypedQuery<T> query = em.createQuery(criteria);
        return query.getResultList();
    }

    @Override
    public void insert(T object) {
        em.persist(object);
    }

    @Override
    public void delete(T object) {
        em.remove(em.merge(object));
    }

    @Transactional(readOnly = true)
    @Override
    public boolean exists(Long id) {
        T entity = this.em.find(this.type, id);
        return entity != null;
    }

    @Override
    public T update(T object) {
        return em.merge(object);
    }
}
