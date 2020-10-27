<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
        <h3 id="kc-page-subtitle">Sign up to your account</h3>
    <#elseif section = "form">
    <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
    <script>
        function togglePassword() {
            var x = document.getElementById("password");
            var v = document.getElementById("vi");
            if (x.type === "password") {
                x.type = "text";
                v.src = "${url.resourcesPath}/img/eye.png";
            } else {
                x.type = "password";
                v.src = "${url.resourcesPath}/img/eye-off.png";
            }
        }
    </script>
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" placeholder="Email/Username" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" />
                </div>
            </div>
            
            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                    </div>
                </div>
            </#if>

            <#if passwordRequired??>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <label class="visibility-signup" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                <div class="${properties.kcInputWrapperClass!}" id="custom-password">
                    <input id="password" class="${properties.kcInputClass!}" placeholder="Password" type="password" name="password" tabindex="2">
                </dv>
            </div>
            </div>
            
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input id="password-confirm" class="${properties.kcInputClass!}" placeholder="Confirm Password" type="password" name="password-confirm">
                </dv>
            </div>
            </div>
            </#if>
            

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!} ">
                <div id="kc-form-reg-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </div>
        <span class="or">OR</span>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="row">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>Continue with ${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
            
        <div id="kc-registration">
            <span>${msg("haveAccount")} <a tabindex="6" href="${url.loginUrl}">${msg("doSignin")}</a></span>
        </div>
    </#if>
    
    
</@layout.registrationLayout>
