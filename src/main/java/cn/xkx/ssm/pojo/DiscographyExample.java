package cn.xkx.ssm.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DiscographyExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DiscographyExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andDiscographyIdIsNull() {
            addCriterion("discography_id is null");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdIsNotNull() {
            addCriterion("discography_id is not null");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdEqualTo(Long value) {
            addCriterion("discography_id =", value, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdNotEqualTo(Long value) {
            addCriterion("discography_id <>", value, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdGreaterThan(Long value) {
            addCriterion("discography_id >", value, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdGreaterThanOrEqualTo(Long value) {
            addCriterion("discography_id >=", value, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdLessThan(Long value) {
            addCriterion("discography_id <", value, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdLessThanOrEqualTo(Long value) {
            addCriterion("discography_id <=", value, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdIn(List<Long> values) {
            addCriterion("discography_id in", values, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdNotIn(List<Long> values) {
            addCriterion("discography_id not in", values, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdBetween(Long value1, Long value2) {
            addCriterion("discography_id between", value1, value2, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyIdNotBetween(Long value1, Long value2) {
            addCriterion("discography_id not between", value1, value2, "discographyId");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameIsNull() {
            addCriterion("discography_name is null");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameIsNotNull() {
            addCriterion("discography_name is not null");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameEqualTo(String value) {
            addCriterion("discography_name =", value, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameNotEqualTo(String value) {
            addCriterion("discography_name <>", value, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameGreaterThan(String value) {
            addCriterion("discography_name >", value, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameGreaterThanOrEqualTo(String value) {
            addCriterion("discography_name >=", value, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameLessThan(String value) {
            addCriterion("discography_name <", value, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameLessThanOrEqualTo(String value) {
            addCriterion("discography_name <=", value, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameLike(String value) {
            addCriterion("discography_name like", value, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameNotLike(String value) {
            addCriterion("discography_name not like", value, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameIn(List<String> values) {
            addCriterion("discography_name in", values, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameNotIn(List<String> values) {
            addCriterion("discography_name not in", values, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameBetween(String value1, String value2) {
            addCriterion("discography_name between", value1, value2, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyNameNotBetween(String value1, String value2) {
            addCriterion("discography_name not between", value1, value2, "discographyName");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateIsNull() {
            addCriterion("discography_date is null");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateIsNotNull() {
            addCriterion("discography_date is not null");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateEqualTo(Date value) {
            addCriterion("discography_date =", value, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateNotEqualTo(Date value) {
            addCriterion("discography_date <>", value, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateGreaterThan(Date value) {
            addCriterion("discography_date >", value, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateGreaterThanOrEqualTo(Date value) {
            addCriterion("discography_date >=", value, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateLessThan(Date value) {
            addCriterion("discography_date <", value, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateLessThanOrEqualTo(Date value) {
            addCriterion("discography_date <=", value, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateIn(List<Date> values) {
            addCriterion("discography_date in", values, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateNotIn(List<Date> values) {
            addCriterion("discography_date not in", values, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateBetween(Date value1, Date value2) {
            addCriterion("discography_date between", value1, value2, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyDateNotBetween(Date value1, Date value2) {
            addCriterion("discography_date not between", value1, value2, "discographyDate");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoIsNull() {
            addCriterion("discography_photo is null");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoIsNotNull() {
            addCriterion("discography_photo is not null");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoEqualTo(String value) {
            addCriterion("discography_photo =", value, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoNotEqualTo(String value) {
            addCriterion("discography_photo <>", value, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoGreaterThan(String value) {
            addCriterion("discography_photo >", value, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoGreaterThanOrEqualTo(String value) {
            addCriterion("discography_photo >=", value, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoLessThan(String value) {
            addCriterion("discography_photo <", value, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoLessThanOrEqualTo(String value) {
            addCriterion("discography_photo <=", value, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoLike(String value) {
            addCriterion("discography_photo like", value, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoNotLike(String value) {
            addCriterion("discography_photo not like", value, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoIn(List<String> values) {
            addCriterion("discography_photo in", values, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoNotIn(List<String> values) {
            addCriterion("discography_photo not in", values, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoBetween(String value1, String value2) {
            addCriterion("discography_photo between", value1, value2, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyPhotoNotBetween(String value1, String value2) {
            addCriterion("discography_photo not between", value1, value2, "discographyPhoto");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionIsNull() {
            addCriterion("discography_descripthion is null");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionIsNotNull() {
            addCriterion("discography_descripthion is not null");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionEqualTo(String value) {
            addCriterion("discography_descripthion =", value, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionNotEqualTo(String value) {
            addCriterion("discography_descripthion <>", value, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionGreaterThan(String value) {
            addCriterion("discography_descripthion >", value, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionGreaterThanOrEqualTo(String value) {
            addCriterion("discography_descripthion >=", value, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionLessThan(String value) {
            addCriterion("discography_descripthion <", value, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionLessThanOrEqualTo(String value) {
            addCriterion("discography_descripthion <=", value, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionLike(String value) {
            addCriterion("discography_descripthion like", value, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionNotLike(String value) {
            addCriterion("discography_descripthion not like", value, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionIn(List<String> values) {
            addCriterion("discography_descripthion in", values, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionNotIn(List<String> values) {
            addCriterion("discography_descripthion not in", values, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionBetween(String value1, String value2) {
            addCriterion("discography_descripthion between", value1, value2, "discographyDescripthion");
            return (Criteria) this;
        }

        public Criteria andDiscographyDescripthionNotBetween(String value1, String value2) {
            addCriterion("discography_descripthion not between", value1, value2, "discographyDescripthion");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}