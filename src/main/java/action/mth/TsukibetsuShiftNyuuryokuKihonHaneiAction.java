/**
 * ファイル名：TsukibetsuShiftNyuuryokuKihonHaneiAction.java
 *
 * 変更履歴
 * 1.0  2010/09/04 Kazuya.Naraki
 */
package action.mth;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.dto.LoginUserDto;
import business.dto.bse.KihonShiftDto;
import business.dto.mth.TsukibetsuShiftDto;
import business.logic.bse.KihonShiftLogic;
import business.logic.comparator.MethodComparator;
import business.logic.mth.TsukibetsuShiftLogic;
import business.logic.utils.CheckUtils;
import business.logic.utils.ComboListUtilLogic;
import business.logic.utils.CommonUtils;
import constant.CommonConstant;
import constant.RequestSessionNameConstant;
import form.common.DateBean;
import form.mth.TsukibetsuShiftNyuuryokuBean;
import form.mth.TsukibetsuShiftNyuuryokuForm;

/**
 * 説明：月別シフト入力出勤希望反映アクションクラス
 * @author naraki
 */
public class TsukibetsuShiftNyuuryokuKihonHaneiAction extends TsukibetsuShiftNyuuryokuAbstractAction{

    /**
     * 説明：月別シフト入力基本シフト反映クラス
     *
     * @param mapping アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @return アクションフォワード
     * @author naraki
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest req, HttpServletResponse res) throws Exception {

        log.info(new Throwable().getStackTrace()[0].getMethodName());

        // フォワードキー
        String forward = CommonConstant.SUCCESS;

        // セッション
        HttpSession session = req.getSession();

        // ログインユーザ情報をセッションより取得
        LoginUserDto loginUserDto = (LoginUserDto) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO);

        // フォーム
        TsukibetsuShiftNyuuryokuForm tsukibetsuShiftForm = (TsukibetsuShiftNyuuryokuForm) form;

        // 対象年月
        String yearMonth = CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl);

        // ロジック生成
        KihonShiftLogic KihonShiftLogic = new KihonShiftLogic();

        // 対象年月の月情報を取得する。
        List<DateBean> dateBeanList = CommonUtils.getDateBeanList(yearMonth);
        
        // 月初の曜日を取得（3-2-1）
        String firstDate = dateBeanList.get(0).getYoubi();
        int firstDateNum = 0;
        switch(firstDate) {
        case "月":
        	firstDateNum = 0;
        	break;
        case "火":
        	firstDateNum = 1;
        	break;
        case "水":
        	firstDateNum = 2;
        	break;
        case "木":
        	firstDateNum = 3;
        	break;
        case "金":
        	firstDateNum = 4;
        	break;
        case "土":
        	firstDateNum = 5;
        	break;
        case "日":
        	firstDateNum = 6;
        	break;
        }
        
        // 配列の生成（3-2-2）
        Map<String, KihonShiftDto> kihonShiftDtoMap = KihonShiftLogic.getKihonShiftData();
        Map<String, List<String>> kihonShift = new HashMap<String, List<String>>();
        for(Entry<String, KihonShiftDto> entry : kihonShiftDtoMap.entrySet()) {
            List<String> dateList = new ArrayList<String>();
        	dateList.add(0, entry.getValue().getShiftIdOnMonday());
        	dateList.add(1, entry.getValue().getShiftIdOnTuesday());
        	dateList.add(2, entry.getValue().getShiftIdOnWednesday());
        	dateList.add(3, entry.getValue().getShiftIdOnThursday());
        	dateList.add(4, entry.getValue().getShiftIdOnFriday());
        	dateList.add(5, entry.getValue().getShiftIdOnSaturday());
        	dateList.add(6, entry.getValue().getShiftIdOnSunday());
//        	for(int i = 0; i < dateList.size(); i++) {
//        		switch(Integer.parseInt(dateList.get(i))) {
//        		case 1:
//        			dateList.set(i, "●");
//        			break;
//        		case 2:
//        			dateList.set(i, "★");
//        			break;
//        		case 3:
//        			dateList.set(i, "▼");
//        			break;
//        		case 4:
//        			dateList.set(i, "■");
//        			break;
//        		}
//        	}
        	kihonShift.put(entry.getKey(), dateList);
    	}
        
        Map<String, String[]> tukiKihonShiftMap = new HashMap<String, String[]>();
        Set<String> kihonShiftKeys = kihonShift.keySet();
        for (String key : kihonShiftKeys) {
            String[] tukiKihonShift = new String[dateBeanList.size()];
        	for(int i = 0; i < dateBeanList.size(); i++) {
	        	if(dateBeanList.get(i).getYoubi().equals("月")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(0);
	        	}else if(dateBeanList.get(i).getYoubi().equals("火")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(1);
	        	}else if(dateBeanList.get(i).getYoubi().equals("水")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(2);
	        	}else if(dateBeanList.get(i).getYoubi().equals("木")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(3);
	        	}else if(dateBeanList.get(i).getYoubi().equals("金")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(4);
	        	}else if(dateBeanList.get(i).getYoubi().equals("土")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(5);
	        	}else if(dateBeanList.get(i).getYoubi().equals("日")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(6);
	        	}
            }
        	tukiKihonShiftMap.put(key, tukiKihonShift);
        }
        
        // ロジック生成
        TsukibetsuShiftLogic tsukibetsuShiftLogic = new TsukibetsuShiftLogic();

        // 希望シフトIDを取得する（3-2-3-1）
        Map<String,List<TsukibetsuShiftDto>> tsukibetsuShiftDtoMap = tsukibetsuShiftLogic.getTsukibetsuShiftDtoMap(yearMonth, false);
        
        Set<String> Keys1 = tukiKihonShiftMap.keySet();
        Set<String> Keys2 = tsukibetsuShiftDtoMap.keySet();
        
        for (String key1 : Keys1) {
        	for (String key2 : Keys2) {
        		if(key1.equals(key2)) {
        			for(int i = 0; i < tsukibetsuShiftDtoMap.get(key2).size(); i++) {
        				tsukibetsuShiftDtoMap.get(key2).get(i).setShiftId(tukiKihonShiftMap.get(key1)[i]);
        			}
        		}
        	}
        }
        
        List<TsukibetsuShiftNyuuryokuBean> tsukibetsuShiftBeanList = new ArrayList<TsukibetsuShiftNyuuryokuBean>();

        // セレクトボックスの取得
        ComboListUtilLogic comboListUtils = new ComboListUtilLogic();
        Map<String, String> shiftCmbMap = comboListUtils.getComboShift(true);
        Map<String, String> yearMonthCmbMap = comboListUtils.getComboYearMonth(CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl), 3, ComboListUtilLogic.KBN_YEARMONTH_NEXT, false);
       
        /** 希望日反映用(ばばれいな) **/
        List<Boolean> backColor = new ArrayList<Boolean>();
        
        if (CheckUtils.isEmpty(kihonShiftDtoMap)) {
            // データなし
        	for(int i= 0;i< tsukibetsuShiftBeanList.size();i++) {
        		
        		backColor.add(i, false);      
        	}
            TsukibetsuShiftNyuuryokuBean tsukibetsuShiftBean = new TsukibetsuShiftNyuuryokuBean();
            tsukibetsuShiftBean.setShainId(loginUserDto.getShainId());
            tsukibetsuShiftBean.setShainName(loginUserDto.getShainName());
            tsukibetsuShiftBean.setRegistFlg(true);
            tsukibetsuShiftBean.setBackColor(backColor);

            tsukibetsuShiftBeanList.add(tsukibetsuShiftBean);
        } else {
            // データあり
            tsukibetsuShiftBeanList = dtoToBean(tsukibetsuShiftDtoMap, loginUserDto);
            for(int i= 0; i < tsukibetsuShiftBeanList.size();i++) {
            	for(int j =0; j < 31;j++) {
            		backColor.add(false);
            	}
            	tsukibetsuShiftBeanList.get(i).setBackColor(backColor);
            }
        }

        // フォームにデータをセットする
        tsukibetsuShiftForm.setShiftCmbMap(shiftCmbMap);
        tsukibetsuShiftForm.setYearMonthCmbMap(yearMonthCmbMap);
        tsukibetsuShiftForm.setTsukibetsuShiftNyuuryokuBeanList(tsukibetsuShiftBeanList);
        tsukibetsuShiftForm.setDateBeanList(dateBeanList);
        tsukibetsuShiftForm.setYearMonth(yearMonth);
        // ページング用
//        tsukibetsuShiftForm.setMaxPage(CommonUtils.getMaxPage(tsukibetsuShiftDtoMap.size(), SHOW_LENGTH));

        return mapping.findForward(forward);
    }

    /**
     * DtoからBeanへ変換する
     * @param tsukibetsuShiftDtoMap
     * @param loginUserDto
     * @return 一覧に表示するリスト
     * @author naraki
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     */
    private List<TsukibetsuShiftNyuuryokuBean> dtoToBean(Map<String, List<TsukibetsuShiftDto>> tsukibetsuShiftDtoMap
                                                      , LoginUserDto loginUserDto)
                                                                        throws IllegalArgumentException,
                                                                        IllegalAccessException,
                                                                        InvocationTargetException {
        Collection<List<TsukibetsuShiftDto>> collection = tsukibetsuShiftDtoMap.values();

        List<TsukibetsuShiftNyuuryokuBean> tsukibetsuShiftBeanList = new ArrayList<TsukibetsuShiftNyuuryokuBean>();

        for (List<TsukibetsuShiftDto> tsukibetsuShiftDtoList : collection) {

            // 実行するオブジェクトの生成
            TsukibetsuShiftNyuuryokuBean tsukibetsuShiftBean = new TsukibetsuShiftNyuuryokuBean();

            // メソッドの取得
            Method[] methods = tsukibetsuShiftBean.getClass().getMethods();

            // メソッドのソートを行う
            Comparator<Method> asc = new MethodComparator();
            Arrays.sort(methods, asc); // 配列をソート

            int index = 0;
            int listSize = tsukibetsuShiftDtoList.size();

            String shainId = "";
            String shainName = "";

            for (int i = 0; i < methods.length; i++) {
                // "setShiftIdXX" のメソッドを動的に実行する
                if (methods[i].getName().startsWith("setShiftId") && listSize > index) {
                    TsukibetsuShiftDto tsukibetsuShiftDto = tsukibetsuShiftDtoList.get(index);
                    // メソッド実行
                    methods[i].invoke(tsukibetsuShiftBean, tsukibetsuShiftDto.getShiftId());

                    shainId = tsukibetsuShiftDto.getShainId();
                    shainName = tsukibetsuShiftDto.getShainName();

                    index ++;
                }
            }

            tsukibetsuShiftBean.setShainId(shainId);
            tsukibetsuShiftBean.setShainName(shainName);
            tsukibetsuShiftBean.setRegistFlg(false);

            tsukibetsuShiftBeanList.add(tsukibetsuShiftBean);

        }

        return tsukibetsuShiftBeanList;
    }
  
    
    /**
     * 月別入力に引き渡し用メソッド
     */
    public  List<TsukibetsuShiftNyuuryokuBean> test(ActionMapping mapping, ActionForm form,
            HttpServletRequest req, HttpServletResponse res) throws Exception {
    	
        log.info(new Throwable().getStackTrace()[0].getMethodName());

        // フォワードキー
        String forward = CommonConstant.SUCCESS;

        // セッション
        HttpSession session = req.getSession();

        // ログインユーザ情報をセッションより取得
        LoginUserDto loginUserDto = (LoginUserDto) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO);

        // 対象年月
        String yearMonth = CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl);

        // ロジック生成
        KihonShiftLogic KihonShiftLogic = new KihonShiftLogic();

        // 対象年月の月情報を取得する。
        List<DateBean> dateBeanList = CommonUtils.getDateBeanList(yearMonth);
        
        // 月初の曜日を取得（3-2-1）
        String firstDate = dateBeanList.get(0).getYoubi();
        int firstDateNum = 0;
        switch(firstDate) {
        case "月":
        	firstDateNum = 0;
        	break;
        case "火":
        	firstDateNum = 1;
        	break;
        case "水":
        	firstDateNum = 2;
        	break;
        case "木":
        	firstDateNum = 3;
        	break;
        case "金":
        	firstDateNum = 4;
        	break;
        case "土":
        	firstDateNum = 5;
        	break;
        case "日":
        	firstDateNum = 6;
        	break;
        }
        
        // 配列の生成（3-2-2）
        Map<String, KihonShiftDto> kihonShiftDtoMap = KihonShiftLogic.getKihonShiftData();
        Map<String, List<String>> kihonShift = new HashMap<String, List<String>>();
        for(Entry<String, KihonShiftDto> entry : kihonShiftDtoMap.entrySet()) {
            List<String> dateList = new ArrayList<String>();
        	dateList.add(0, entry.getValue().getShiftIdOnMonday());
        	dateList.add(1, entry.getValue().getShiftIdOnTuesday());
        	dateList.add(2, entry.getValue().getShiftIdOnWednesday());
        	dateList.add(3, entry.getValue().getShiftIdOnThursday());
        	dateList.add(4, entry.getValue().getShiftIdOnFriday());
        	dateList.add(5, entry.getValue().getShiftIdOnSaturday());
        	dateList.add(6, entry.getValue().getShiftIdOnSunday());
        	kihonShift.put(entry.getKey(), dateList);
    	}
        
        Map<String, String[]> tukiKihonShiftMap = new HashMap<String, String[]>();
        Set<String> kihonShiftKeys = kihonShift.keySet();
        for (String key : kihonShiftKeys) {
            String[] tukiKihonShift = new String[dateBeanList.size()];
        	for(int i = 0; i < dateBeanList.size(); i++) {
	        	if(dateBeanList.get(i).getYoubi().equals("月")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(0);
	        	}else if(dateBeanList.get(i).getYoubi().equals("火")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(1);
	        	}else if(dateBeanList.get(i).getYoubi().equals("水")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(2);
	        	}else if(dateBeanList.get(i).getYoubi().equals("木")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(3);
	        	}else if(dateBeanList.get(i).getYoubi().equals("金")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(4);
	        	}else if(dateBeanList.get(i).getYoubi().equals("土")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(5);
	        	}else if(dateBeanList.get(i).getYoubi().equals("日")) {
	        		tukiKihonShift[i] = kihonShift.get(key).get(6);
	        	}
            }
        	tukiKihonShiftMap.put(key, tukiKihonShift);
        }
        
        // ロジック生成
        TsukibetsuShiftLogic tsukibetsuShiftLogic = new TsukibetsuShiftLogic();

        // 希望シフトIDを取得する（3-2-3-1）
        Map<String,List<TsukibetsuShiftDto>> tsukibetsuShiftDtoMap = tsukibetsuShiftLogic.getTsukibetsuShiftDtoMap(yearMonth, false);
        
        Set<String> Keys1 = tukiKihonShiftMap.keySet();
        Set<String> Keys2 = tsukibetsuShiftDtoMap.keySet();
        
        for (String key1 : Keys1) {
        	for (String key2 : Keys2) {
        		if(key1.equals(key2)) {
        			for(int i = 0; i < tsukibetsuShiftDtoMap.get(key2).size(); i++) {
        				tsukibetsuShiftDtoMap.get(key2).get(i).setShiftId(tukiKihonShiftMap.get(key1)[i]);
        			}
        		}
        	}
        }
        
        List<TsukibetsuShiftNyuuryokuBean> tsukibetsuShiftBeanList = new ArrayList<TsukibetsuShiftNyuuryokuBean>();

        if (CheckUtils.isEmpty(kihonShiftDtoMap)) {
            // データなし
            TsukibetsuShiftNyuuryokuBean tsukibetsuShiftBean = new TsukibetsuShiftNyuuryokuBean();
            tsukibetsuShiftBean.setShainId(loginUserDto.getShainId());
            tsukibetsuShiftBean.setShainName(loginUserDto.getShainName());
            tsukibetsuShiftBean.setRegistFlg(true);

            tsukibetsuShiftBeanList.add(tsukibetsuShiftBean);
        } else {
            // データあり
            tsukibetsuShiftBeanList = dtoToBean(tsukibetsuShiftDtoMap, loginUserDto);
            
        }

        
        return tsukibetsuShiftBeanList;
    }

}
