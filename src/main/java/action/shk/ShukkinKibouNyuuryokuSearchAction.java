 /* ファイル名：ShukkinKibouNyuuryokuSearchAction.java
 *
 * 変更履歴
 * 1.0  2024/02/29 reina baba
 */
package action.shk;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.dto.LoginUserDto;
import business.dto.shk.ShukkinKibouNyuuryokuDto;
import business.logic.comparator.MethodComparator;
import business.logic.shk.ShukkinKibouLogic;
import business.logic.utils.CheckUtils;
import business.logic.utils.ComboListUtilLogic;
import business.logic.utils.CommonUtils;
import constant.CommonConstant;
import constant.RequestSessionNameConstant;
import form.common.DateBean;
import form.shk.ShukkinKibouNyuuryokuBean;
import form.shk.ShukkinKibouNyuuryokuForm;

public class ShukkinKibouNyuuryokuSearchAction extends ShukkinKibouAbstractAction{
	
	  /**
     * 説明：出勤希望日入力画面表示アクションクラス
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
        ShukkinKibouNyuuryokuForm shukkinKibouNyuuryokuForm = (ShukkinKibouNyuuryokuForm) form;

        // 対象年月
        String yearMonth = shukkinKibouNyuuryokuForm.getYearMonth();

        if (CheckUtils.isEmpty(yearMonth)) {
            yearMonth = CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl);
        }

        // ロジック生成
        ShukkinKibouLogic shukkinKibouLogic = new ShukkinKibouLogic();

        // 対象年月の月情報を取得する。
        List<DateBean> dateBeanList = CommonUtils.getDateBeanList(yearMonth);

        // 出勤希望日を取得する
       List<ShukkinKibouNyuuryokuDto> nyuuryokuDtoListList = shukkinKibouLogic.getShukkinKibouNyuuryokuDtoList(loginUserDto.getShainId(),yearMonth);

        List<ShukkinKibouNyuuryokuBean> shukkinKibouNyuuryokuBeanList = new ArrayList<ShukkinKibouNyuuryokuBean>();

        // セレクトボックスの取得
        ComboListUtilLogic comboListUtils = new ComboListUtilLogic();
        Map<String, String> shiftCmbMap = comboListUtils.getComboShift(false);
        Map<String, String> yearMonthCmbMap = comboListUtils.getComboYearMonth(CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl), 3, ComboListUtilLogic.KBN_YEARMONTH_NEXT, false);

        if (CheckUtils.isEmpty(nyuuryokuDtoListList)) {
            // データなし
            forward = CommonConstant.NODATA;
        } else {
            // データあり
            shukkinKibouNyuuryokuBeanList = dtoToBean(nyuuryokuDtoListList, loginUserDto);
        }

        // フォームにデータをセットする
        shukkinKibouNyuuryokuForm.setShiftCmbMap(shiftCmbMap);
        shukkinKibouNyuuryokuForm.setYearMonthCmbMap(yearMonthCmbMap);
        shukkinKibouNyuuryokuForm.setShukkinKibouNyuuryokuBeanList(shukkinKibouNyuuryokuBeanList);
        shukkinKibouNyuuryokuForm.setDateBeanList(dateBeanList);
        shukkinKibouNyuuryokuForm.setYearMonth(yearMonth);

        return mapping.findForward(forward);
    }

	private List<ShukkinKibouNyuuryokuBean> dtoToBean(List<ShukkinKibouNyuuryokuDto> nyuuryokuDtoListList,
			LoginUserDto loginUserDto)
			throws IllegalArgumentException, IllegalAccessException, InvocationTargetException {
		List<ShukkinKibouNyuuryokuBean> shukkinKibouNyuuryokuBeanList = new ArrayList<ShukkinKibouNyuuryokuBean>();

// 社員分のループ
		for (ShukkinKibouNyuuryokuDto nyuuryokuDtoList : nyuuryokuDtoListList) {

// 実行するオブジェクトの生成
			ShukkinKibouNyuuryokuBean shukkinKibouNyuuryokuBean = new ShukkinKibouNyuuryokuBean();

// メソッドの取得
			Method[] methods = shukkinKibouNyuuryokuBean.getClass().getMethods();

// ソートを行う
			Comparator<Method> asc = new MethodComparator();
			Arrays.sort(methods, asc); // 配列をソート

// 社員名
			String shainId = "";
			String shainName = "";

			int index = 0;
			for (int i = 0; i < methods.length; i++) {
// "setShiftIdXX" のメソッドを動的に実行する
				if (methods[i].getName().startsWith("setSymbol")) {
					if (index <  nyuuryokuDtoListList.size()) {
					} else {
// データなしの場合はハイフン
						methods[i].invoke(shukkinKibouNyuuryokuBean, "-");
					}

					index++;
				}
			}

// 社員ID、名前をセット
			shukkinKibouNyuuryokuBean.setShainId(shainId);
			shukkinKibouNyuuryokuBean.setShainName(shainName);

			shukkinKibouNyuuryokuBeanList.add(shukkinKibouNyuuryokuBean);
		}

		return shukkinKibouNyuuryokuBeanList;
	}

}
