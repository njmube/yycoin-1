// function checkBean(){
//     if ($$('bank')!='' && $$('bank') === $$('excludeBank') ){
//         alert('适用银行和不适用银行不能重复!');
//         return false;
//     } else if ($$('industryName')!='' && $$('industryName') === $$('excludeIndustryName') ){
//         alert('事业部不能重复!');
//         return false;
//     } else if ($$('industryName2')!='' && $$('industryName2') === $$('excludeIndustryName2') ){
//         alert('大区不能重复!');
//         return false;
//     } else if ($$('industryName3')!='' && $$('industryName3') === $$('excludeIndustryName3') ){
//         alert('部门不能重复!');
//         return false;
//     } else if ($$('stafferName')!='' && $$('stafferName') === $$('excludeStafferName') ){
//         alert('人员不能重复!');
//         return false;
//     } else  if ($$('province')!='' && $$('province') === $$('excludeProvince') ){
//         alert('省份不能重复!');
//         return false;
//     } else  if ($$('city')!='' && $$('city') === $$('excludeCity') ){
//         alert('城市不能重复!');
//         return false;
//     }
// }


function checkBean(){
    if ($$('bank')!='' && $$('excludeBank') !=''){
        alert('适用银行和不适用银行不能同时填写!');
        return false;
    } else if ($$('industryName')!='' && $$('excludeIndustryName')!=''){
        alert('事业部和不包含事业部不能同时填写!');
        return false;
    } else if ($$('industryName2')!='' && $$('excludeIndustryName2')!=''){
        alert('大区和不包含大区不能同时填写!');
        return false;
    } else if ($$('industryName3')!='' && $$('excludeIndustryName3') !='' ){
        alert('部门和不包含部门不能同时填写!');
        return false;
    } else if ($$('stafferName')!='' && $$('excludeStafferName') !='' ){
        alert('人员和不包含人员不能同时填写!');
        return false;
    } else  if ($$('province')!='' && $$('excludeProvince') !='' ){
        alert('省份和不包含省份不能同时填写!');
        return false;
    } else  if ($$('city')!='' && $$('excludeCity') !=''){
        alert('城市和不包含城市不能同时填写!');
        return false;
    } else  if ($$('customerName')!='' && $$('excludeCustomerName') !=''){
        alert('支行和不包含支行不能同时填写!');
        return false;
    } else  if ($$('branchName')!='' && $$('excludeBranchName') !=''){
        alert('分行和不包含分行不能同时填写!');
        return false;
    } else  if ($$('channel')!='' && $$('excludeChannel') !=''){
        alert('渠道和不包含渠道不能同时填写!');
        return false;
    }

    var companyShare = $$('companyShare');
    var stafferShare = $$('stafferShare');
    // console.log(Number(companyShare));
    // console.log(Number(stafferShare));
    if(Number(companyShare) + Number(stafferShare)!= 0 && Number(companyShare)+Number(stafferShare)!= 100){
        alert('公司和个人承担比例之和必须为100或者0!');
        return false;
    }
}