package cn.xkx.ssm.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CommentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CommentExample() {
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

        public Criteria andCommentIdIsNull() {
            addCriterion("comment_id is null");
            return (Criteria) this;
        }

        public Criteria andCommentIdIsNotNull() {
            addCriterion("comment_id is not null");
            return (Criteria) this;
        }

        public Criteria andCommentIdEqualTo(Long value) {
            addCriterion("comment_id =", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdNotEqualTo(Long value) {
            addCriterion("comment_id <>", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdGreaterThan(Long value) {
            addCriterion("comment_id >", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdGreaterThanOrEqualTo(Long value) {
            addCriterion("comment_id >=", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdLessThan(Long value) {
            addCriterion("comment_id <", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdLessThanOrEqualTo(Long value) {
            addCriterion("comment_id <=", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdIn(List<Long> values) {
            addCriterion("comment_id in", values, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdNotIn(List<Long> values) {
            addCriterion("comment_id not in", values, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdBetween(Long value1, Long value2) {
            addCriterion("comment_id between", value1, value2, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdNotBetween(Long value1, Long value2) {
            addCriterion("comment_id not between", value1, value2, "commentId");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Long value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Long value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Long value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Long value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Long value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Long> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Long> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Long value1, Long value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Long value1, Long value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andArticleIdIsNull() {
            addCriterion("article_id is null");
            return (Criteria) this;
        }

        public Criteria andArticleIdIsNotNull() {
            addCriterion("article_id is not null");
            return (Criteria) this;
        }

        public Criteria andArticleIdEqualTo(Long value) {
            addCriterion("article_id =", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdNotEqualTo(Long value) {
            addCriterion("article_id <>", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdGreaterThan(Long value) {
            addCriterion("article_id >", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdGreaterThanOrEqualTo(Long value) {
            addCriterion("article_id >=", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdLessThan(Long value) {
            addCriterion("article_id <", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdLessThanOrEqualTo(Long value) {
            addCriterion("article_id <=", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdIn(List<Long> values) {
            addCriterion("article_id in", values, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdNotIn(List<Long> values) {
            addCriterion("article_id not in", values, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdBetween(Long value1, Long value2) {
            addCriterion("article_id between", value1, value2, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdNotBetween(Long value1, Long value2) {
            addCriterion("article_id not between", value1, value2, "articleId");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountIsNull() {
            addCriterion("comment_like_count is null");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountIsNotNull() {
            addCriterion("comment_like_count is not null");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountEqualTo(Long value) {
            addCriterion("comment_like_count =", value, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountNotEqualTo(Long value) {
            addCriterion("comment_like_count <>", value, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountGreaterThan(Long value) {
            addCriterion("comment_like_count >", value, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountGreaterThanOrEqualTo(Long value) {
            addCriterion("comment_like_count >=", value, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountLessThan(Long value) {
            addCriterion("comment_like_count <", value, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountLessThanOrEqualTo(Long value) {
            addCriterion("comment_like_count <=", value, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountIn(List<Long> values) {
            addCriterion("comment_like_count in", values, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountNotIn(List<Long> values) {
            addCriterion("comment_like_count not in", values, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountBetween(Long value1, Long value2) {
            addCriterion("comment_like_count between", value1, value2, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentLikeCountNotBetween(Long value1, Long value2) {
            addCriterion("comment_like_count not between", value1, value2, "commentLikeCount");
            return (Criteria) this;
        }

        public Criteria andCommentDateIsNull() {
            addCriterion("comment_date is null");
            return (Criteria) this;
        }

        public Criteria andCommentDateIsNotNull() {
            addCriterion("comment_date is not null");
            return (Criteria) this;
        }

        public Criteria andCommentDateEqualTo(Date value) {
            addCriterion("comment_date =", value, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentDateNotEqualTo(Date value) {
            addCriterion("comment_date <>", value, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentDateGreaterThan(Date value) {
            addCriterion("comment_date >", value, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentDateGreaterThanOrEqualTo(Date value) {
            addCriterion("comment_date >=", value, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentDateLessThan(Date value) {
            addCriterion("comment_date <", value, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentDateLessThanOrEqualTo(Date value) {
            addCriterion("comment_date <=", value, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentDateIn(List<Date> values) {
            addCriterion("comment_date in", values, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentDateNotIn(List<Date> values) {
            addCriterion("comment_date not in", values, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentDateBetween(Date value1, Date value2) {
            addCriterion("comment_date between", value1, value2, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentDateNotBetween(Date value1, Date value2) {
            addCriterion("comment_date not between", value1, value2, "commentDate");
            return (Criteria) this;
        }

        public Criteria andCommentContentIsNull() {
            addCriterion("comment_content is null");
            return (Criteria) this;
        }

        public Criteria andCommentContentIsNotNull() {
            addCriterion("comment_content is not null");
            return (Criteria) this;
        }

        public Criteria andCommentContentEqualTo(String value) {
            addCriterion("comment_content =", value, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentNotEqualTo(String value) {
            addCriterion("comment_content <>", value, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentGreaterThan(String value) {
            addCriterion("comment_content >", value, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentGreaterThanOrEqualTo(String value) {
            addCriterion("comment_content >=", value, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentLessThan(String value) {
            addCriterion("comment_content <", value, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentLessThanOrEqualTo(String value) {
            addCriterion("comment_content <=", value, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentLike(String value) {
            addCriterion("comment_content like", value, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentNotLike(String value) {
            addCriterion("comment_content not like", value, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentIn(List<String> values) {
            addCriterion("comment_content in", values, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentNotIn(List<String> values) {
            addCriterion("comment_content not in", values, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentBetween(String value1, String value2) {
            addCriterion("comment_content between", value1, value2, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentContentNotBetween(String value1, String value2) {
            addCriterion("comment_content not between", value1, value2, "commentContent");
            return (Criteria) this;
        }

        public Criteria andCommentStairIsNull() {
            addCriterion("comment_stair is null");
            return (Criteria) this;
        }

        public Criteria andCommentStairIsNotNull() {
            addCriterion("comment_stair is not null");
            return (Criteria) this;
        }

        public Criteria andCommentStairEqualTo(Long value) {
            addCriterion("comment_stair =", value, "commentStair");
            return (Criteria) this;
        }

        public Criteria andCommentStairNotEqualTo(Long value) {
            addCriterion("comment_stair <>", value, "commentStair");
            return (Criteria) this;
        }

        public Criteria andCommentStairGreaterThan(Long value) {
            addCriterion("comment_stair >", value, "commentStair");
            return (Criteria) this;
        }

        public Criteria andCommentStairGreaterThanOrEqualTo(Long value) {
            addCriterion("comment_stair >=", value, "commentStair");
            return (Criteria) this;
        }

        public Criteria andCommentStairLessThan(Long value) {
            addCriterion("comment_stair <", value, "commentStair");
            return (Criteria) this;
        }

        public Criteria andCommentStairLessThanOrEqualTo(Long value) {
            addCriterion("comment_stair <=", value, "commentStair");
            return (Criteria) this;
        }

        public Criteria andCommentStairIn(List<Long> values) {
            addCriterion("comment_stair in", values, "commentStair");
            return (Criteria) this;
        }

        public Criteria andCommentStairNotIn(List<Long> values) {
            addCriterion("comment_stair not in", values, "commentStair");
            return (Criteria) this;
        }

        public Criteria andCommentStairBetween(Long value1, Long value2) {
            addCriterion("comment_stair between", value1, value2, "commentStair");
            return (Criteria) this;
        }

        public Criteria andCommentStairNotBetween(Long value1, Long value2) {
            addCriterion("comment_stair not between", value1, value2, "commentStair");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdIsNull() {
            addCriterion("parent_commend_id is null");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdIsNotNull() {
            addCriterion("parent_commend_id is not null");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdEqualTo(Long value) {
            addCriterion("parent_commend_id =", value, "parentCommendId");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdNotEqualTo(Long value) {
            addCriterion("parent_commend_id <>", value, "parentCommendId");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdGreaterThan(Long value) {
            addCriterion("parent_commend_id >", value, "parentCommendId");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdGreaterThanOrEqualTo(Long value) {
            addCriterion("parent_commend_id >=", value, "parentCommendId");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdLessThan(Long value) {
            addCriterion("parent_commend_id <", value, "parentCommendId");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdLessThanOrEqualTo(Long value) {
            addCriterion("parent_commend_id <=", value, "parentCommendId");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdIn(List<Long> values) {
            addCriterion("parent_commend_id in", values, "parentCommendId");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdNotIn(List<Long> values) {
            addCriterion("parent_commend_id not in", values, "parentCommendId");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdBetween(Long value1, Long value2) {
            addCriterion("parent_commend_id between", value1, value2, "parentCommendId");
            return (Criteria) this;
        }

        public Criteria andParentCommendIdNotBetween(Long value1, Long value2) {
            addCriterion("parent_commend_id not between", value1, value2, "parentCommendId");
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