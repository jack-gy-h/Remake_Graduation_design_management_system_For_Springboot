package com.example.demo.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LogExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table log
     *
     * @mbggenerated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table log
     *
     * @mbggenerated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table log
     *
     * @mbggenerated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public LogExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table log
     *
     * @mbggenerated
     */
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

        public Criteria andLidIsNull() {
            addCriterion("lId is null");
            return (Criteria) this;
        }

        public Criteria andLidIsNotNull() {
            addCriterion("lId is not null");
            return (Criteria) this;
        }

        public Criteria andLidEqualTo(String value) {
            addCriterion("lId =", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidNotEqualTo(String value) {
            addCriterion("lId <>", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidGreaterThan(String value) {
            addCriterion("lId >", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidGreaterThanOrEqualTo(String value) {
            addCriterion("lId >=", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidLessThan(String value) {
            addCriterion("lId <", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidLessThanOrEqualTo(String value) {
            addCriterion("lId <=", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidLike(String value) {
            addCriterion("lId like", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidNotLike(String value) {
            addCriterion("lId not like", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidIn(List<String> values) {
            addCriterion("lId in", values, "lid");
            return (Criteria) this;
        }

        public Criteria andLidNotIn(List<String> values) {
            addCriterion("lId not in", values, "lid");
            return (Criteria) this;
        }

        public Criteria andLidBetween(String value1, String value2) {
            addCriterion("lId between", value1, value2, "lid");
            return (Criteria) this;
        }

        public Criteria andLidNotBetween(String value1, String value2) {
            addCriterion("lId not between", value1, value2, "lid");
            return (Criteria) this;
        }

        public Criteria andLactionIsNull() {
            addCriterion("lAction is null");
            return (Criteria) this;
        }

        public Criteria andLactionIsNotNull() {
            addCriterion("lAction is not null");
            return (Criteria) this;
        }

        public Criteria andLactionEqualTo(String value) {
            addCriterion("lAction =", value, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionNotEqualTo(String value) {
            addCriterion("lAction <>", value, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionGreaterThan(String value) {
            addCriterion("lAction >", value, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionGreaterThanOrEqualTo(String value) {
            addCriterion("lAction >=", value, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionLessThan(String value) {
            addCriterion("lAction <", value, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionLessThanOrEqualTo(String value) {
            addCriterion("lAction <=", value, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionLike(String value) {
            addCriterion("lAction like", value, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionNotLike(String value) {
            addCriterion("lAction not like", value, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionIn(List<String> values) {
            addCriterion("lAction in", values, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionNotIn(List<String> values) {
            addCriterion("lAction not in", values, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionBetween(String value1, String value2) {
            addCriterion("lAction between", value1, value2, "laction");
            return (Criteria) this;
        }

        public Criteria andLactionNotBetween(String value1, String value2) {
            addCriterion("lAction not between", value1, value2, "laction");
            return (Criteria) this;
        }

        public Criteria andLcreatorIsNull() {
            addCriterion("lCreator is null");
            return (Criteria) this;
        }

        public Criteria andLcreatorIsNotNull() {
            addCriterion("lCreator is not null");
            return (Criteria) this;
        }

        public Criteria andLcreatorEqualTo(String value) {
            addCriterion("lCreator =", value, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorNotEqualTo(String value) {
            addCriterion("lCreator <>", value, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorGreaterThan(String value) {
            addCriterion("lCreator >", value, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorGreaterThanOrEqualTo(String value) {
            addCriterion("lCreator >=", value, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorLessThan(String value) {
            addCriterion("lCreator <", value, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorLessThanOrEqualTo(String value) {
            addCriterion("lCreator <=", value, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorLike(String value) {
            addCriterion("lCreator like", value, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorNotLike(String value) {
            addCriterion("lCreator not like", value, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorIn(List<String> values) {
            addCriterion("lCreator in", values, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorNotIn(List<String> values) {
            addCriterion("lCreator not in", values, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorBetween(String value1, String value2) {
            addCriterion("lCreator between", value1, value2, "lcreator");
            return (Criteria) this;
        }

        public Criteria andLcreatorNotBetween(String value1, String value2) {
            addCriterion("lCreator not between", value1, value2, "lcreator");
            return (Criteria) this;
        }

        public Criteria andIurlIsNull() {
            addCriterion("IUrl is null");
            return (Criteria) this;
        }

        public Criteria andIurlIsNotNull() {
            addCriterion("IUrl is not null");
            return (Criteria) this;
        }

        public Criteria andIurlEqualTo(String value) {
            addCriterion("IUrl =", value, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlNotEqualTo(String value) {
            addCriterion("IUrl <>", value, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlGreaterThan(String value) {
            addCriterion("IUrl >", value, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlGreaterThanOrEqualTo(String value) {
            addCriterion("IUrl >=", value, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlLessThan(String value) {
            addCriterion("IUrl <", value, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlLessThanOrEqualTo(String value) {
            addCriterion("IUrl <=", value, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlLike(String value) {
            addCriterion("IUrl like", value, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlNotLike(String value) {
            addCriterion("IUrl not like", value, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlIn(List<String> values) {
            addCriterion("IUrl in", values, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlNotIn(List<String> values) {
            addCriterion("IUrl not in", values, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlBetween(String value1, String value2) {
            addCriterion("IUrl between", value1, value2, "iurl");
            return (Criteria) this;
        }

        public Criteria andIurlNotBetween(String value1, String value2) {
            addCriterion("IUrl not between", value1, value2, "iurl");
            return (Criteria) this;
        }

        public Criteria andLremarkIsNull() {
            addCriterion("lRemark is null");
            return (Criteria) this;
        }

        public Criteria andLremarkIsNotNull() {
            addCriterion("lRemark is not null");
            return (Criteria) this;
        }

        public Criteria andLremarkEqualTo(String value) {
            addCriterion("lRemark =", value, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkNotEqualTo(String value) {
            addCriterion("lRemark <>", value, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkGreaterThan(String value) {
            addCriterion("lRemark >", value, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkGreaterThanOrEqualTo(String value) {
            addCriterion("lRemark >=", value, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkLessThan(String value) {
            addCriterion("lRemark <", value, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkLessThanOrEqualTo(String value) {
            addCriterion("lRemark <=", value, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkLike(String value) {
            addCriterion("lRemark like", value, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkNotLike(String value) {
            addCriterion("lRemark not like", value, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkIn(List<String> values) {
            addCriterion("lRemark in", values, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkNotIn(List<String> values) {
            addCriterion("lRemark not in", values, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkBetween(String value1, String value2) {
            addCriterion("lRemark between", value1, value2, "lremark");
            return (Criteria) this;
        }

        public Criteria andLremarkNotBetween(String value1, String value2) {
            addCriterion("lRemark not between", value1, value2, "lremark");
            return (Criteria) this;
        }

        public Criteria andLtaskIsNull() {
            addCriterion("lTask is null");
            return (Criteria) this;
        }

        public Criteria andLtaskIsNotNull() {
            addCriterion("lTask is not null");
            return (Criteria) this;
        }

        public Criteria andLtaskEqualTo(String value) {
            addCriterion("lTask =", value, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskNotEqualTo(String value) {
            addCriterion("lTask <>", value, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskGreaterThan(String value) {
            addCriterion("lTask >", value, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskGreaterThanOrEqualTo(String value) {
            addCriterion("lTask >=", value, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskLessThan(String value) {
            addCriterion("lTask <", value, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskLessThanOrEqualTo(String value) {
            addCriterion("lTask <=", value, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskLike(String value) {
            addCriterion("lTask like", value, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskNotLike(String value) {
            addCriterion("lTask not like", value, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskIn(List<String> values) {
            addCriterion("lTask in", values, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskNotIn(List<String> values) {
            addCriterion("lTask not in", values, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskBetween(String value1, String value2) {
            addCriterion("lTask between", value1, value2, "ltask");
            return (Criteria) this;
        }

        public Criteria andLtaskNotBetween(String value1, String value2) {
            addCriterion("lTask not between", value1, value2, "ltask");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeIsNull() {
            addCriterion("lCreatetime is null");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeIsNotNull() {
            addCriterion("lCreatetime is not null");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeEqualTo(Date value) {
            addCriterion("lCreatetime =", value, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeNotEqualTo(Date value) {
            addCriterion("lCreatetime <>", value, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeGreaterThan(Date value) {
            addCriterion("lCreatetime >", value, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("lCreatetime >=", value, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeLessThan(Date value) {
            addCriterion("lCreatetime <", value, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("lCreatetime <=", value, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeIn(List<Date> values) {
            addCriterion("lCreatetime in", values, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeNotIn(List<Date> values) {
            addCriterion("lCreatetime not in", values, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeBetween(Date value1, Date value2) {
            addCriterion("lCreatetime between", value1, value2, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("lCreatetime not between", value1, value2, "lcreatetime");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleIsNull() {
            addCriterion("lCreatorRole is null");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleIsNotNull() {
            addCriterion("lCreatorRole is not null");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleEqualTo(String value) {
            addCriterion("lCreatorRole =", value, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleNotEqualTo(String value) {
            addCriterion("lCreatorRole <>", value, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleGreaterThan(String value) {
            addCriterion("lCreatorRole >", value, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleGreaterThanOrEqualTo(String value) {
            addCriterion("lCreatorRole >=", value, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleLessThan(String value) {
            addCriterion("lCreatorRole <", value, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleLessThanOrEqualTo(String value) {
            addCriterion("lCreatorRole <=", value, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleLike(String value) {
            addCriterion("lCreatorRole like", value, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleNotLike(String value) {
            addCriterion("lCreatorRole not like", value, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleIn(List<String> values) {
            addCriterion("lCreatorRole in", values, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleNotIn(List<String> values) {
            addCriterion("lCreatorRole not in", values, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleBetween(String value1, String value2) {
            addCriterion("lCreatorRole between", value1, value2, "lcreatorrole");
            return (Criteria) this;
        }

        public Criteria andLcreatorroleNotBetween(String value1, String value2) {
            addCriterion("lCreatorRole not between", value1, value2, "lcreatorrole");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table log
     *
     * @mbggenerated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table log
     *
     * @mbggenerated
     */
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