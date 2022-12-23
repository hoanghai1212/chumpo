var o={tag:"",branch:"",commit:""};var n=()=>o.tag!==""?o.tag:o.commit!==""?`${o.branch} [${o.commit.substring(0,7)}]`:"Local build";export{n as getVersionInfo};
