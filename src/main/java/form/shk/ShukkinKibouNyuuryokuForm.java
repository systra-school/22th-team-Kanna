/**
 * ファイル名：ShukkinKibouNyuuryokuForm.java
 *
 * 変更履歴
 * 1.0  2010/10/06 Kazuya.Naraki
 */
package form.shk;

import java.util.List;
import java.util.Map;

import org.apache.struts.action.ActionForm;

import form.common.DateBean;

/**
 * 説明：出勤希望日入力フォーム
 * @author naraki
 *
 */
public class ShukkinKibouNyuuryokuForm extends ActionForm {

    /** 出勤希望入力リスト */
    private List<ShukkinKibouNyuuryokuBean> shukkinKibouNyuuryokuBeanList;
    /** 日付リスト */
    private List<DateBean> dateBeanList;
    /** 年月 */
    private String yearMonth;
    /** シフトコンボ */
    private Map<String, String> shiftCmbMap;
    /** 年月コンボ */
    private Map<String, String> yearMonthCmbMap;
    /** ページング用 */
    private String paging;
    /** オフセット */
    private int offset;
    /** 表示ページ */
    private int cntPage;
    /** 最大ページ */
    private int maxPage;
    
    public String getPaging() {
		return paging;
	}
	public void setPaging(String paging) {
		this.paging = paging;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getCntPage() {
		return cntPage;
	}
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

    /**
     * @return yearMonth
     */
    public String getYearMonth() {
        return yearMonth;
    }
    /**
     * @param yearMonth をセットする
     */
    public void setYearMonth(String yearMonth) {
        this.yearMonth = yearMonth;
    }
    /**
     * @return shukkinKibouNyuuryokuBeanList
     */
    public List<ShukkinKibouNyuuryokuBean> getShukkinKibouNyuuryokuBeanList() {
        return shukkinKibouNyuuryokuBeanList;
    }
    /**
     * @param shukkinKibouNyuuryokuBeanList をセットする
     */
    public void setShukkinKibouNyuuryokuBeanList(
            List<ShukkinKibouNyuuryokuBean> shukkinKibouNyuuryokuBeanList) {
        this.shukkinKibouNyuuryokuBeanList = shukkinKibouNyuuryokuBeanList;
    }
    /**
     * @return dateBeanList
     */
    public List<DateBean> getDateBeanList() {
        return dateBeanList;
    }
    /**
     * @param dateBeanList をセットする
     */
    public void setDateBeanList(List<DateBean> dateBeanList) {
        this.dateBeanList = dateBeanList;
    }
    /**
     * @return shiftCmbMap
     */
    public Map<String, String> getShiftCmbMap() {
        return shiftCmbMap;
    }
    /**
     * @param shiftCmbMap をセットする
     */
    public void setShiftCmbMap(Map<String, String> shiftCmbMap) {
        this.shiftCmbMap = shiftCmbMap;
    }
    /**
     * @return yearMonthCmbMap
     */
    public Map<String, String> getYearMonthCmbMap() {
        return yearMonthCmbMap;
    }
    /**
     * @param yearMonthCmbMap をセットする
     */
    public void setYearMonthCmbMap(Map<String, String> yearMonthCmbMap) {
        this.yearMonthCmbMap = yearMonthCmbMap;
    }

}
