/* ファイル名：ShukkinKibouNyuuryokuPageAction.java
 *
 * 変更履歴
 * 1.0  2024/02/29 reina baba
 */package action.shk;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import constant.CommonConstant;
import form.shk.ShukkinKibouNyuuryokuForm;

/**
  * 説明：出勤希望日入力画面ページ変更アクションクラス
  * @author naraki
  *
  */
public class ShukkinKibouNyuuryokuPageAction extends ShukkinKibouAbstractAction{

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

	        // フォーム
	        ShukkinKibouNyuuryokuForm shukkinKibouNyuuryokuForm = (ShukkinKibouNyuuryokuForm) form;

	        // 一覧のサイズ
	        int listSize = shukkinKibouNyuuryokuForm.getShukkinKibouNyuuryokuBeanList().size();

	        // ページング
	        String paging = shukkinKibouNyuuryokuForm.getPaging();
	        int offset = shukkinKibouNyuuryokuForm.getOffset();
	        int cntPage = shukkinKibouNyuuryokuForm.getCntPage();

	        int nextOffset = 0;

	        if (CommonConstant.NEXT.equals(paging)) {
	            // 次ページ
	            nextOffset = offset + SHOW_LENGTH;

	            if (nextOffset < listSize) {
	                // 一覧のサイズ未満の場合は
	                offset = nextOffset;
	                cntPage++;
	            }
	        } else {
	            // 前ページ
	            nextOffset = offset - SHOW_LENGTH;

	            if (nextOffset < 0) {
	                offset = 0;
	            } else {
	                offset = nextOffset;
	                cntPage--;
	            }
	        }

	        shukkinKibouNyuuryokuForm.setOffset(offset);
	        shukkinKibouNyuuryokuForm.setCntPage(cntPage);

	        return mapping.findForward(forward);
	    }

	}
