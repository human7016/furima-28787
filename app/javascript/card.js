const pay = () => {
  Payjp.setPublicKey("pk_test_586106b5cad5ec812f6d07c0"); //PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault(); //Railsのフォーム送信をキャンセル
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    //カード情報入力
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`
    };
      debugger
    Payjp.createToken(card, (status, response) => {
      //トークンの生成に成功したら変数tokenに代入しパラメータとして送信
      if (status == 200) {
        const token = response.id;
        
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      debugger

      //パラメータからカード情報の値を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit(); //フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").reset(); 
      console.log("OK")
      debugger
    });
  });
};

window.addEventListener("load", pay);