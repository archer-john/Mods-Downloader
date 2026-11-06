@echo off
setlocal EnableDelayedExpansion
powershell "Write-Host '[' -NoNewline; Write-Host 'Starting' -ForegroundColor Green -NoNewline; Write-Host ']'"

set "MC_DIR=%APPDATA%\.minecraft"
if not exist "!MC_DIR!" (
powershell -NoProfile -Command "Write-Host -NoNewline; Write-Host 'WALA KA NAMAN MINECRAFT E' -ForegroundColor Red -NoNewline; Write-Host"
    pause
    exit /b 1
)

echo.
echo  Where do you want to install the mods?
echo.
echo   [1] .minecraft\mods
echo   [2] .minecraft\versions\(choose a version)
echo.
set /p "DIRCHOICE=Enter choice (1 or 2): "

if "!DIRCHOICE!"=="1" (
    set "MODS_DIR=!MC_DIR!\mods"
) else if "!DIRCHOICE!"=="2" (
    set "VERSIONS_DIR=!MC_DIR!\versions"
    if not exist "!VERSIONS_DIR!" (
        echo No versions folder found.
        pause
        exit /b 1
    )

    set /a vCount=0
    for /d %%V in ("!VERSIONS_DIR!\*") do (
        set /a vCount+=1
        set "vName[!vCount!]=%%~nxV"
    )

    if !vCount! EQU 0 (
        echo No version folders found inside .minecraft\versions. Install neoforge 1.21.1 and choose [1]
        pause
        exit /b 1
    )

    echo.
    echo  Available versions:
    for /l %%v in (1,1,!vCount!) do (
        echo   [%%v] !vName[%%v]!
    )
    echo.
    set /p "VCHOICE=Enter the number of the version: "

    if !VCHOICE! LSS 1 (
        echo Invalid choice.
        pause
        exit /b 1
    )
    if !VCHOICE! GTR !vCount! (
        echo Invalid choice.
        pause
        exit /b 1
    )

    call set "CHOSEN_VERSION=%%vName[!VCHOICE!]%%"
    set "MODS_DIR=!VERSIONS_DIR!\!CHOSEN_VERSION!\mods"

    if not exist "!MODS_DIR!" (
		echo.
        echo  Creating mods folder for !CHOSEN_VERSION!...
        mkdir "!MODS_DIR!"
    )
) else (
    echo Invalid choice.
    pause
    exit /b 1
)

if not exist "!MODS_DIR!" (
    echo Mods folder not found: !MODS_DIR!
    pause
    exit /b 1
)
echo.
echo  Installing to: !MODS_DIR!
echo.

cd /d "!MODS_DIR!"

set modAmount=179
set "fileName[1]=accessories-neoforge-1.1.0-beta.54+1.21.1.jar"
set "modURL[1]=https://www.dropbox.com/scl/fi/sqkrzk1t5v4y8ofa3trv9/accessories-neoforge-1.1.0-beta.54-1.21.1.jar?rlkey=mnokh0yrahvcvf5ueyp6s9cr6&st=6xxa5clm&dl=1"

set "fileName[2]=adorablehamsterpets-3.7.0-1.21.1+neoforge.jar"
set "modURL[2]=https://www.dropbox.com/scl/fi/22my09udmsubq2yy57e1d/adorablehamsterpets-3.7.0-1.21.1-neoforge.jar?rlkey=65rz6olyz85yhto6ia1dx0d8i&st=uysp5u1d&dl=1"

set "fileName[3]=aether-1.21.1-1.5.10-neoforge.jar"
set "modURL[3]=https://www.dropbox.com/scl/fi/si2wh4ypqg0vxm7sjqhun/aether-1.21.1-1.5.10-neoforge.jar?rlkey=q9929szb7uey4v4jwz4j4arn8&st=h3mxlc4o&dl=1"

set "fileName[4]=aether-ruined-portal-3.4.jar"
set "modURL[4]=https://www.dropbox.com/scl/fi/88xbde8b41iedb78iwtay/aether-ruined-portal-3.4.jar?rlkey=i9dnc8rawqdx0qi0jgz8bkqki&st=6g2mshkr&dl=1"

set "fileName[5]=AetherVillages-1.21.1-1.0.8-neoforge.jar"
set "modURL[5]=https://www.dropbox.com/scl/fi/88726p8tloicidw2d70na/AetherVillages-1.21.1-1.0.8-neoforge.jar?rlkey=cuowv3t5f3geag8us6kmz8dc4&st=30aqt0p3&dl=1"

set "fileName[6]=Apotheosis-1.21.1-8.9.0.jar"
set "modURL[6]=https://www.dropbox.com/scl/fi/ff5geqx8pqwmkoju317yx/Apotheosis-1.21.1-8.9.0.jar?rlkey=kam3vcsn4z4qiglztmdeuxsmt&st=xf5w3xum&dl=1"

set "fileName[7]=ApothicAttributes-1.21.1-2.11.0.jar"
set "modURL[7]=https://www.dropbox.com/scl/fi/eoyjsgrvza5jkc3tj5me2/ApothicAttributes-1.21.1-2.11.0.jar?rlkey=jz2g3rh1e3klu4yndnoljlsg0&st=q7ui804i&dl=1"

set "fileName[8]=apothiccombat-1.2.1.jar"
set "modURL[8]=https://www.dropbox.com/scl/fi/9igi76chw9m3q1kfgoe96/apothiccombat-1.2.1.jar?rlkey=rv4dkrrszrzo2akeu38ev3tkh&st=zl5w8lkv&dl=1"

set "fileName[9]=ApothicEnchanting-1.21.1-1.6.4.jar"
set "modURL[9]=https://www.dropbox.com/scl/fi/62r02i684gvynp1g3jsyb/ApothicEnchanting-1.21.1-1.6.4.jar?rlkey=4g82ekgad1uxk8ujoxw5ylhx3&st=82vigeag&dl=1"

set "fileName[10]=ApothicSpawners-1.21.1-1.4.0.jar"
set "modURL[10]=https://www.dropbox.com/scl/fi/atxf1x0lz5agq98dn7rbz/ApothicSpawners-1.21.1-1.4.0.jar?rlkey=dy3gdxekps4075nl1tx6nybh4&st=6yjcd7l9&dl=1"

set "fileName[11]=appleskin-neoforge-mc1.21-3.0.9.jar"
set "modURL[11]=https://www.dropbox.com/scl/fi/gcglxb59hmtb1porjguyt/appleskin-neoforge-mc1.21-3.0.9.jar?rlkey=46c38x57oktv7layhe5386utp&st=jrjwgo1h&dl=1"

set "fileName[12]=architectury-13.0.11-neoforge.jar"
set "modURL[12]=https://www.dropbox.com/scl/fi/qngklua1vucppm7wqe6hc/architectury-13.0.11-neoforge.jar?rlkey=wcoax5ct6xug65c0wg5z5mryf&st=y9jvatqp&dl=1"

set "fileName[13]=ash_api-neoforge-21.1.1.jar"
set "modURL[13]=https://www.dropbox.com/scl/fi/xprmvg6ypk5r16fbwpdec/ash_api-neoforge-21.1.1.jar?rlkey=gwwd9unkcpzwlvkhxpq6s1a0n&st=fa0xiaxq&dl=1"

set "fileName[14]=azurelib-neo-1.21.1-3.2.7.jar"
set "modURL[14]=https://www.dropbox.com/scl/fi/denxk6szgxwy7yjliwe6t/azurelib-neo-1.21.1-3.2.7.jar?rlkey=vh9djy91kttw865y1x7iqk0oa&st=e4q5u88v&dl=1"

set "fileName[15]=balm-neoforge-1.21.1-21.0.67.jar"
set "modURL[15]=https://www.dropbox.com/scl/fi/ji92o45pi69afssane1bf/balm-neoforge-1.21.1-21.0.67.jar?rlkey=4zv01qvfg3t2ekkgvb8ikl53l&st=8of8kvae&dl=1"

set "fileName[16]=bettercombat-neoforge-2.4.0+1.21.1.jar"
set "modURL[16]=https://www.dropbox.com/scl/fi/d2g81knv0g40ndnza7f8q/bettercombat-neoforge-2.4.0-1.21.1.jar?rlkey=3t02lwn867vns86cbgjhsx26q&st=auyfyn22&dl=1"

set "fileName[17]=bettervillage-neoforge-1.21.1-3.3.1.jar"
set "modURL[17]=https://www.dropbox.com/scl/fi/zexwg00zkse9nu2jeouox/bettervillage-neoforge-1.21.1-3.3.1.jar?rlkey=utsd5ks7vo0vu4ftwo45yu674&st=1rg1sq7l&dl=1"

set "fileName[18]=blueprint-1.21.1-8.2.0.jar"
set "modURL[18]=https://www.dropbox.com/scl/fi/0hs6nz09ca4yvwl7lb5h8/blueprint-1.21.1-8.2.0.jar?rlkey=r9l56i63s7jvrmpyrprodfqiz&st=kp3ia8jt&dl=1"

set "fileName[19]=bookshelf-neoforge-1.21.1-21.1.81.jar"
set "modURL[19]=https://www.dropbox.com/scl/fi/kjfl0fiiccd7jer93jyoc/bookshelf-neoforge-1.21.1-21.1.81.jar?rlkey=40rnuwqb7x7tpm850xg25fp46&st=sigg2mci&dl=1"

set "fileName[20]=burnt_basic-1.10.5.3-neoforge-1.21.1.jar"
set "modURL[20]=https://www.dropbox.com/scl/fi/ohl5bxjw9a0okf96ysqt1/burnt_basic-1.10.5.3-neoforge-1.21.1.jar?rlkey=ms18qyfyc5c4spo2sde7693fd&st=y7gd0i1u&dl=1"

set "fileName[21]=burnt-1.10.5.3-neoforge-1.21.1.jar"
set "modURL[21]=https://www.dropbox.com/scl/fi/6desrs66s05s0m044s93e/burnt-1.10.5.3-neoforge-1.21.1.jar?rlkey=49k51pu6oan1odfbbcrkhh3xy&st=nk5hm4ow&dl=1"

set "fileName[22]=caelus-neoforge-7.0.1+1.21.1.jar"
set "modURL[22]=https://www.dropbox.com/scl/fi/k2z9fuajy452agi614c86/caelus-neoforge-7.0.1-1.21.1.jar?rlkey=qzpxhmoacv7g289z1766ocyk1&st=71rjf1zf&dl=1"

set "fileName[23]=carryon-neoforge-1.21.1-2.2.6.13.jar"
set "modURL[23]=https://www.dropbox.com/scl/fi/q32nq4spvb8889oiqrcs7/carryon-neoforge-1.21.1-2.2.6.13.jar?rlkey=y2ev2cbrn5nm1wqwt0m1mhhvz&st=pcygkail&dl=1"

set "fileName[24]=chalk-neoforge-1.21.1-2.0.3.jar"
set "modURL[24]=https://www.dropbox.com/scl/fi/2xoyos457h6r0twcdbfe7/chalk-neoforge-1.21.1-2.0.3.jar?rlkey=7yi6bptts1b6zsljxnw0vlhe8&st=ntsmjxha&dl=1"

set "fileName[25]=chunksfadein-neoforge-3.0.26-1.21.jar"
set "modURL[25]=https://www.dropbox.com/scl/fi/085c2whlpapqxqu1tscut/chunksfadein-neoforge-3.0.26-1.21.jar?rlkey=kkkmy2wkbcww3m3qm29ui8agq&st=j4eydbmo&dl=1"

set "fileName[26]=Cinematic Interaction-NeoForge-1.21.1-0.18.30.jar"
set "modURL[26]=https://www.dropbox.com/scl/fi/ijkonnzrevwy629oyxv1n/Cinematic-Interaction-NeoForge-1.21.1-0.18.30.jar?rlkey=i4e7vxqvi8vqcefddhfkhadmy&st=k3c1r58z&dl=1"

set "fileName[27]=citadel-1.21.1-2.7.6.jar"
set "modURL[27]=https://www.dropbox.com/scl/fi/1rsw9igeaevlau3b78b2w/citadel-1.21.1-2.7.6.jar?rlkey=x578d3hmnhzeavxjtotqx0kee&st=belwnjhf&dl=1"

set "fileName[28]=clayworks-1.21.1-4.0.3.jar"
set "modURL[28]=https://www.dropbox.com/scl/fi/8o5tua7luypu3ue7x78sq/clayworks-1.21.1-4.0.3.jar?rlkey=3ai12fislnpivxwst7hs3dwks&st=0vdm3ezh&dl=1"

set "fileName[29]=cloth-config-15.0.140-neoforge.jar"
set "modURL[29]=https://www.dropbox.com/scl/fi/2umw0nizw7vtlfvlrdmoz/cloth-config-15.0.140-neoforge.jar?rlkey=sot0uqv8pkh8cy5fdrutbe35o&st=hyk6jm1g&dl=1"

set "fileName[30]=cmparallelpipes-neoforge-2.0.2.jar"
set "modURL[30]=https://www.dropbox.com/scl/fi/ntrjm49wn5g72tdax9gaf/cmparallelpipes-neoforge-2.0.2.jar?rlkey=bngota3nct7ve3o2ld8nrwdja&st=8mtgbud2&dl=1"

set "fileName[31]=collective-1.21.1-8.81.jar"
set "modURL[31]=https://www.dropbox.com/scl/fi/2dl57u1kff9qj8ycpkx8n/collective-1.21.1-8.81.jar?rlkey=22uzxjzrt3ogev6uo2xduoj0x&st=ajkok4g9&dl=1"

set "fileName[32]=common-networking-neoforge-1.0.21-1.21.1.jar"
set "modURL[32]=https://www.dropbox.com/scl/fi/ga4ttz4tbnirq4cjfmo49/common-networking-neoforge-1.0.21-1.21.1.jar?rlkey=vcbyrg86sih23hc9v6wk7bj9d&st=1qy8cf0h&dl=1"

set "fileName[33]=connectiblechains-2.5.0+1.21.1-neoforge.jar"
set "modURL[33]=https://www.dropbox.com/scl/fi/btq1k5ys6dmkb2nhbf8eo/connectiblechains-2.5.0-1.21.1-neoforge.jar?rlkey=xr5qmqjlltggjdhrnpmk33skm&st=q8si90lu&dl=1"

set "fileName[34]=connector-2.0.0-beta.17+1.21.1-full.jar"
set "modURL[34]=https://www.dropbox.com/scl/fi/wi4ed8m2wkb8al1lb436w/connector-2.0.0-beta.17-1.21.1-full.jar?rlkey=cenc3bxu223j05cg4fulzrdks&st=zzzlvc6e&dl=1"

set "fileName[35]=ConnectorExtras-1.12.1+1.21.1.jar"
set "modURL[35]=https://www.dropbox.com/scl/fi/muipdqn7pszt10ir3jmex/ConnectorExtras-1.12.1-1.21.1.jar?rlkey=sn5f9ok5hxr7ju5zi6he9d5uw&st=vqu6wwb8&dl=1"

set "fileName[36]=copycats-3.0.9+mc.1.21.1-neoforge.jar"
set "modURL[36]=https://www.dropbox.com/scl/fi/op4bke3obuogm4c6t2zsd/copycats-3.0.9-mc.1.21.1-neoforge.jar?rlkey=amvryqpo4tuvaa8doqiubsyqw&st=vng65lm8&dl=1"

set "fileName[37]=coroutil-neoforge-1.21.0-1.3.8.jar"
set "modURL[37]=https://www.dropbox.com/scl/fi/1bpddfpmd0vi5xsz5v1jh/coroutil-neoforge-1.21.0-1.3.8.jar?rlkey=k3x6hswuhtjy2ej6u1zi7fmn4&st=yy29clkm&dl=1"

set "fileName[38]=Create Encased-1.21.1-1.10.0-fix1.jar"
set "modURL[38]=https://www.dropbox.com/scl/fi/rfz21lnq3dzrcctaezreo/Create-Encased-1.21.1-1.10.0-fix1.jar?rlkey=emf6yh549iffh0n6r4unfncnp&st=0l2tg3m4&dl=1"

set "fileName[39]=create_connected-1.3.3-mc1.21.1.jar"
set "modURL[39]=https://www.dropbox.com/scl/fi/p61ordbcuolrvwq7si6sq/create_connected-1.3.3-mc1.21.1.jar?rlkey=z4g2rwr20noczyysi1lnbehtx&st=gomz76ds&dl=1"

set "fileName[40]=create_sophback_compat-1.0.jar"
set "modURL[40]=https://www.dropbox.com/scl/fi/z8b1q4mvfm3xurx8mqbss/create_sophback_compat-1.0.jar?rlkey=m784e70eso0dqbwcffs74nfw0&st=h8gnh31e&dl=1"

set "fileName[41]=create_submarine-3.3.0.jar"
set "modURL[41]=https://www.dropbox.com/scl/fi/jyzabfvh8y4znpvv1l39x/create_submarine-3.3.0.jar?rlkey=uqyiu3pfp7wft9tgbdmldm2fm&st=366vr3qa&dl=1"

set "fileName[42]=create-1.21.1-6.0.10.jar"
set "modURL[42]=https://www.dropbox.com/scl/fi/zcp46z05az6gnnmg8w89l/create-1.21.1-6.0.10.jar?rlkey=xtkb5xzomjfjw69rfnm6at0u4&st=46qwf5xf&dl=1"

set "fileName[43]=createaddition-1.7.2.jar"
set "modURL[43]=https://www.dropbox.com/scl/fi/nfk76rrtwk7lay2a7dtci/createaddition-1.7.2.jar?rlkey=9kdvo7dhnz0jgaidv2wuvwiyk&st=o86rlu61&dl=1"

set "fileName[44]=create-aeronautics-bundled-1.21.1-1.3.2.jar"
set "modURL[44]=https://www.dropbox.com/scl/fi/73yn0d9p8mgl7m0nrs1tv/create-aeronautics-bundled-1.21.1-1.3.2.jar?rlkey=bdgizocab2s749igc6xgzdbyy&st=tnihlrvw&dl=1"

set "fileName[45]=createbigcannons-5.11.7+mc.1.21.1.jar"
set "modURL[45]=https://www.dropbox.com/scl/fi/twb7ofvuqi78c6erug9qo/createbigcannons-5.11.7-mc.1.21.1.jar?rlkey=pnic6ctgf5rqsbipp93ygvai0&st=bj1utwck&dl=1"

set "fileName[46]=create-central-kitchen-2.6.2b.jar"
set "modURL[46]=https://www.dropbox.com/scl/fi/bl04wiwtkfrnkmjledyr3/create-central-kitchen-2.6.2b.jar?rlkey=l1iavw5fu1gcb4hqiswmg1950&st=gmmhba24&dl=1"

set "fileName[47]=createcontraptionterminals-1.21-1.4.0.jar"
set "modURL[47]=https://www.dropbox.com/scl/fi/414ewubx04qsi0z2qzbw8/createcontraptionterminals-1.21-1.4.0.jar?rlkey=36dvgknpm8ednosanktzb93fs&st=bcjfxnyg&dl=1"

set "fileName[48]=createdeco-2.1.3.jar"
set "modURL[48]=https://www.dropbox.com/scl/fi/s0fq2771u52rvsti517ks/createdeco-2.1.3.jar?rlkey=xrbnpl30l38yymdb0rnoftf4v&st=gaf1jgg5&dl=1"

set "fileName[49]=CreateDragonsPlus-1.11.9.jar"
set "modURL[49]=https://www.dropbox.com/scl/fi/swk1ug382fcrt75ndal17/CreateDragonsPlus-1.11.9.jar?rlkey=m28t7aqu535nw3s2hl0cj6ppi&st=ieowyl3j&dl=1"

set "fileName[50]=createenchantablemachinery-3.6.0+mc1.21.1-neoforge.jar"
set "modURL[50]=https://www.dropbox.com/scl/fi/105f64lbuvvh1buvdr2j5/createenchantablemachinery-3.6.0-mc1.21.1-neoforge.jar?rlkey=sypea48aryizjei5neiywuvr7&st=bk64r0au&dl=1"

set "fileName[51]=create-enchantment-industry-2.4.2.jar"
set "modURL[51]=https://www.dropbox.com/scl/fi/5xlc1equs03a3kw6iqxg1/create-enchantment-industry-2.4.2.jar?rlkey=9xvq04obnyi94y1b1k4nym1i7&st=4apdkcmy&dl=1"

set "fileName[52]=createendertransmission-2.1.1-1.21.1.jar"
set "modURL[52]=https://www.dropbox.com/scl/fi/f4r1vdjz0fnuq1nia3l94/createendertransmission-2.1.1-1.21.1.jar?rlkey=dfslantnm2d13hp3f4wod7e21&st=ewgu8zzy&dl=1"

set "fileName[53]=createmetalwork-neoforge-1.21.1-3.0.0.jar"
set "modURL[53]=https://www.dropbox.com/scl/fi/t4qadrx2rfrd2rgp2u7h9/createmetalwork-neoforge-1.21.1-3.0.0.jar?rlkey=q19wbx6vyghk5pm8y6z1oxn2w&st=w7alkcir&dl=1"

set "fileName[54]=createnuclear-2.0.0-neoforge.jar"
set "modURL[54]=https://www.dropbox.com/scl/fi/asjy5quxbl5bc50uuhi6a/createnuclear-2.0.0-neoforge.jar?rlkey=ikej13wj9i7cebrgr4uovyti6&st=f0t6cjds&dl=1"

set "fileName[55]=create-stuff-additions1.21.1_v2.1.4b.jar"
set "modURL[55]=https://www.dropbox.com/scl/fi/28qujjy3tkgbbu8duibe9/create-stuff-additions1.21.1_v2.1.4b.jar?rlkey=2kg48iv4ctfzne556vketaqim&st=7l2ckb4z&dl=1"

set "fileName[56]=cristellib-neoforge-1.21.1-3.1.7.jar"
set "modURL[56]=https://www.dropbox.com/scl/fi/kw2k70b3737p141fovlpl/cristellib-neoforge-1.21.1-3.1.7.jar?rlkey=hicv3z2lipvhxuqzwn79o2oft&st=rdp3m248&dl=1"

set "fileName[57]=cumulus_menus-1.21.1-2.0.8-neoforge.jar"
set "modURL[57]=https://www.dropbox.com/scl/fi/x5fp5h6354n2ays32xae7/cumulus_menus-1.21.1-2.0.8-neoforge.jar?rlkey=4v2mvyu7juyozpmvw9xfqu026&st=cucx8l10&dl=1"

set "fileName[58]=curios-neoforge-9.5.1+1.21.1.jar"
set "modURL[58]=https://www.dropbox.com/scl/fi/2d6ufk7kwqxcrcewb3z9x/curios-neoforge-9.5.1-1.21.1.jar?rlkey=vk9qzolcke5pv1527mjj1wqy6&st=8pcm8iz5&dl=1"

set "fileName[59]=deep_aether-1.21.1-1.1.5.1.jar"
set "modURL[59]=https://www.dropbox.com/scl/fi/qpweh1qcyp3ffm6rvhj28/deep_aether-1.21.1-1.1.5.1.jar?rlkey=7wktybel37gpagu8cuiaqa8it&st=kgh70mw6&dl=1"

set "fileName[60]=deimos-1.21.1-neoforge-2.8.jar"
set "modURL[60]=https://www.dropbox.com/scl/fi/wv0mxi4d1l3yyj8cuxkem/deimos-1.21.1-neoforge-2.8.jar?rlkey=z2r42owl95fb6zonzy3g8axfv&st=fvq9agz2&dl=1"

set "fileName[61]=deployer-0.1.3.jar"
set "modURL[61]=https://www.dropbox.com/scl/fi/w0nusfifz0325lf7yyldw/deployer-0.1.3.jar?rlkey=wb8xou1zf2g5bki34jbet0qk6&st=iuonrtea&dl=1"

set "fileName[62]=do_a_barrel_roll-neoforge-3.7.3+1.21.jar"
set "modURL[62]=https://www.dropbox.com/scl/fi/6ic6fydo00hk82onpefg1/do_a_barrel_roll-neoforge-3.7.3-1.21.jar?rlkey=hr910m3phdb9dnz6yrev9di2l&st=eebn3noo&dl=1"

set "fileName[63]=dungeons-and-taverns-v4.4.4.jar"
set "modURL[63]=https://www.dropbox.com/scl/fi/9mig3k30up9mjrjpdkos6/dungeons-and-taverns-v4.4.4.jar?rlkey=gp8sqg1etnp05rk3w6sg3q7ii&st=jgi58i6t&dl=1"

set "fileName[64]=durabilitytooltip-1.2.0-neoforge-mc1.21.jar"
set "modURL[64]=https://www.dropbox.com/scl/fi/a8fab04tkrrs6w590jn2z/durabilitytooltip-1.2.0-neoforge-mc1.21.jar?rlkey=5sheyqq6mtsooxkcvwl7m3zw4&st=htyio3rp&dl=1"

set "fileName[65]=EasyAnvils-v21.1.0-1.21.1-NeoForge.jar"
set "modURL[65]=https://www.dropbox.com/scl/fi/wimbbxfyngmbq2nlr6c6f/EasyAnvils-v21.1.0-1.21.1-NeoForge.jar?rlkey=3a4u754vxv5gsqdq6kb9nm6bi&st=o7t5rbbd&dl=1"

set "fileName[66]=EasyShulkerBoxes-v21.1.3-1.21.1-NeoForge.jar"
set "modURL[66]=https://www.dropbox.com/scl/fi/bihqguda6tvma7k8hxug6/EasyShulkerBoxes-v21.1.3-1.21.1-NeoForge.jar?rlkey=gutmpgqa9904fnwdhxlchp2m1&st=p79wf1pb&dl=1"

set "fileName[67]=enchdesc-neoforge-1.21.1-21.1.11.jar"
set "modURL[67]=https://www.dropbox.com/scl/fi/tkst63mu39m6168hrptgw/enchdesc-neoforge-1.21.1-21.1.11.jar?rlkey=vzmn45tn2qs4bie9pcq94gzkm&st=bvk46xx8&dl=1"

set "fileName[68]=endersdelight-1.3.1.jar"
set "modURL[68]=https://www.dropbox.com/scl/fi/vgdo1t02i6hgv57ihwh4u/endersdelight-1.3.1.jar?rlkey=8osuftcuzl91y2ofustzc2ex8&st=s8v3y8sw&dl=1"

set "fileName[69]=entity_model_features-3.3.12-1.21-neoforge.jar"
set "modURL[69]=https://www.dropbox.com/scl/fi/ieqtxmz6gkbhof8q9x5ib/entity_model_features-3.3.12-1.21-neoforge.jar?rlkey=f2jszy0jpf9swpvarb3cp3fbx&st=y30iu623&dl=1"

set "fileName[70]=entity_texture_features-7.2.7-1.21-neoforge.jar"
set "modURL[70]=https://www.dropbox.com/scl/fi/nbvtutph76u07forfdt32/entity_texture_features-7.2.7-1.21-neoforge.jar?rlkey=yzkdr0jgtxjzen2k3p1w250ge&st=h3g0bb2b&dl=1"

set "fileName[71]=entityculling-neoforge-1.11.3-mc1.21.1.jar"
set "modURL[71]=https://www.dropbox.com/scl/fi/gz6s7w5pvql4s99et1h27/entityculling-neoforge-1.11.3-mc1.21.1.jar?rlkey=7u5dizbgo1zy3oiws36weayj3&st=cgup15jj&dl=1"

set "fileName[72]=extra_gauges-2.1.3.jar"
set "modURL[72]=https://www.dropbox.com/scl/fi/5sf76kgw2dlrktcx68sp6/extra_gauges-2.1.3.jar?rlkey=86m0ltme4to2atweexfma8f2x&st=ios0v1gn&dl=1"

set "fileName[73]=FarmersDelight-1.21.1-1.3.4.jar"
set "modURL[73]=https://www.dropbox.com/scl/fi/8v4ohnzrgtsjevt8n8xo5/FarmersDelight-1.21.1-1.3.4.jar?rlkey=c1vsrd2twz11vgptik5pg5xzy&st=6ua5smis&dl=1"

set "fileName[74]=fast-ip-ping-v1.0.12-mc1.21.1-neoforge.jar"
set "modURL[74]=https://www.dropbox.com/scl/fi/81uqvim3uqlef96rxmelk/fast-ip-ping-v1.0.12-mc1.21.1-neoforge.jar?rlkey=ooyem9st10u9jf33j6bv7bze0&st=8vngy28t&dl=1"

set "fileName[75]=ferritecore-7.0.3-neoforge.jar"
set "modURL[75]=https://www.dropbox.com/scl/fi/kdnu2y6v6oarsbnjpil1s/ferritecore-7.0.3-neoforge.jar?rlkey=mflq4d6lsale4996q24m2p49d&st=g3g3lc2s&dl=1"

set "fileName[76]=fishingreal-neoforge-1.21.1-1.9.1.jar"
set "modURL[76]=https://www.dropbox.com/scl/fi/42i2pmyi9lza3hjsi6t0f/fishingreal-neoforge-1.21.1-1.9.1.jar?rlkey=ocohiun5giqscqjg971h93ogm&st=58zcq2k6&dl=1"

set "fileName[77]=ForgeConfigAPIPort-v21.1.6-1.21.1-NeoForge.jar"
set "modURL[77]=https://www.dropbox.com/scl/fi/8id0y20icjbpqrzz0tyg0/ForgeConfigAPIPort-v21.1.6-1.21.1-NeoForge.jar?rlkey=kuluh1eydq1v1uq348fuvdq75&st=nprlw2f0&dl=1"

set "fileName[78]=forgified-fabric-api-0.116.15+2.3.6+1.21.1.jar"
set "modURL[78]=https://www.dropbox.com/scl/fi/6201ekcuxwfcq763bwf6g/forgified-fabric-api-0.116.15-2.3.6-1.21.1.jar?rlkey=g926jloetqeshw6l27i13c67y&st=3v0npfwj&dl=1"

set "fileName[79]=fragmentum-5.4.0+1.21.1-neoforge.jar"
set "modURL[79]=https://www.dropbox.com/scl/fi/a8dks7h5i3tqaxsuylnuz/fragmentum-5.4.0-1.21.1-neoforge.jar?rlkey=43p93dggutthzwp6zh18bhms2&st=u4cykldr&dl=1"

set "fileName[80]=fzzy_config-0.7.7+fix1+1.21+neoforge.jar"
set "modURL[80]=https://www.dropbox.com/scl/fi/70fplqkr5760e0gtr0mgp/fzzy_config-0.7.7-fix1-1.21-neoforge.jar?rlkey=djxs7imrizas6s8hi2tvc9x5k&st=t43kkedy&dl=1"

set "fileName[81]=geckolib-neoforge-1.21.1-4.9.3.jar"
set "modURL[81]=https://www.dropbox.com/scl/fi/22dgycn6p3s5fxd2cecel/geckolib-neoforge-1.21.1-4.9.3.jar?rlkey=w0h14ykgv9mzpnclkagw2pbr7&st=34v1q9bo&dl=1"

set "fileName[82]=gliders-1.21.1-neoforge-1.1.8.jar"
set "modURL[82]=https://www.dropbox.com/scl/fi/k5mlpmid3sau79h67tkpu/gliders-1.21.1-neoforge-1.1.8.jar?rlkey=70kn120fcyb7x9c6d3m0rq0sk&st=7cj4zt7m&dl=1"

set "fileName[83]=grind-enchantments-4.0.1+neoforge-1.21.1.jar"
set "modURL[83]=https://www.dropbox.com/scl/fi/k9lxchi6gwqcr5zfl5eun/grind-enchantments-4.0.1-neoforge-1.21.1.jar?rlkey=vpd79nyf6nbyx1b7w11yc18z5&st=21p2yxfb&dl=1"

set "fileName[84]=Icarus-NeoForge-4.8.0.jar"
set "modURL[84]=https://www.dropbox.com/scl/fi/g2uorsjwuaz9pnc86oz1k/Icarus-NeoForge-4.8.0.jar?rlkey=qfpmdrxio2gcttblkpvj4idi6&st=1q8qf1ya&dl=1"

set "fileName[85]=IceAndFireCE-2.2-1.21.1-neoforge.jar"
set "modURL[85]=https://www.dropbox.com/scl/fi/318v5hpmlyglvkos2vija/IceAndFireCE-2.2-1.21.1-neoforge.jar?rlkey=eibjivizn7ctxm5etuakcqno4&st=a4i0x2ky&dl=1"

set "fileName[86]=iceandfirexbettercombat-1.21.1.jar"
set "modURL[86]=https://www.dropbox.com/scl/fi/gbgxfxca8cw65nejsog9b/iceandfirexbettercombat-1.21.1.jar?rlkey=14yfpst4p9xvr1j42exr6zyi3&st=qxqjtomh&dl=1"

set "fileName[87]=incubation-1.21.1-5.0.2.jar"
set "modURL[87]=https://www.dropbox.com/scl/fi/hdsu5edu8u0wxrj9jr8rm/incubation-1.21.1-5.0.2.jar?rlkey=utaeb0a76ofi1ly8khk6v780i&st=abecudx9&dl=1"

set "fileName[88]=Jade-1.21.1-NeoForge-15.10.6.jar"
set "modURL[88]=https://www.dropbox.com/scl/fi/xk9iztevberyoigcwoc2g/Jade-1.21.1-NeoForge-15.10.6.jar?rlkey=tzju5k1bsrula2os59go6l83r&st=opkxmh1i&dl=1"

set "fileName[89]=JadeAddons-1.21.1-NeoForge-6.1.2.jar"
set "modURL[89]=https://www.dropbox.com/scl/fi/fdikykmqgdsoayntidash/JadeAddons-1.21.1-NeoForge-6.1.2.jar?rlkey=rbqqzcoabwbw97zzdoibqm9i8&st=xt6yrm9s&dl=1"

set "fileName[90]=jei-1.21.1-neoforge-19.64.0.455.jar"
set "modURL[90]=https://www.dropbox.com/scl/fi/pml77c17zx4t7p23s61zw/jei-1.21.1-neoforge-19.64.0.455.jar?rlkey=z6z425i54ghhhy2vynhw6d420&st=blsmdg6b&dl=1"

set "fileName[91]=journeymap-neoforge-1.21.1-6.0.9.jar"
set "modURL[91]=https://www.dropbox.com/scl/fi/70o7tsane7eup688waidn/journeymap-neoforge-1.21.1-6.0.9.jar?rlkey=0pgiaiqygw73nb57zur8x4lqf&st=m0fq18nw&dl=1"

set "fileName[92]=jupiter-2.3.7-1.21.1-neoforge.jar"
set "modURL[92]=https://www.dropbox.com/scl/fi/16hmnxbwi23shssa574ql/jupiter-2.3.7-1.21.1-neoforge.jar?rlkey=viravsmlvfw35m3c2cpz1mqnm&st=wgz9nbuk&dl=1"

set "fileName[93]=kaleidoscope_end-1.1.0-neoforge+mc1.21.1.jar"
set "modURL[93]=https://www.dropbox.com/scl/fi/2we137clh6suqzo5bwi13/kaleidoscope_end-1.1.0-neoforge-mc1.21.1.jar?rlkey=xpqa1ougljjw58p8hh4qe41g8&st=dso3xpx4&dl=1"

set "fileName[94]=kaleidoscope_ImmersiveEating-neoforge1.21.1-1.5.5.jar"
set "modURL[94]=https://www.dropbox.com/scl/fi/0pnc0iobecspw6zbntw9z/kaleidoscope_ImmersiveEating-neoforge1.21.1-1.5.5.jar?rlkey=2quhy0pf9vqpyyzystvo9g30h&st=1ywyhp6c&dl=1"

set "fileName[95]=kaleidoscope_lib-1.1.1-neoforge-mc1.21.jar"
set "modURL[95]=https://www.dropbox.com/scl/fi/6xgc4e9cexyls62aqlr3j/kaleidoscope_lib-1.1.1-neoforge-mc1.21.1.jar?rlkey=truoxtwg0b0senvyoa5i2b6ue&st=3v1xivo7&dl=1"

set "fileName[96]=kaleidoscope_twilight-1.2.0-neoforge+mc1.21.1.jar"
set "modURL[96]=https://www.dropbox.com/scl/fi/epo0qemr9f6ftmjjkvj7i/kaleidoscope_twilight-1.2.0-neoforge-mc1.21.1.jar?rlkey=xjkh1rplpiq1xniwpxs2w6tkw&st=c91r0woo&dl=1"

set "fileName[97]=kaleidoscopecookery-1.6.0-neoforge+mc1.21.1.jar"
set "modURL[97]=https://www.dropbox.com/scl/fi/0nimxpb6886nun3ffzhov/kaleidoscopecookery-1.6.0-neoforge-mc1.21.1.jar?rlkey=z9ox2jrjizqo2qc6h389g6uqh&st=kj6xa0gp&dl=1"

set "fileName[98]=konkrete_neoforge_1.9.9_MC_1.21.jar"
set "modURL[98]=https://www.dropbox.com/scl/fi/ejbvvz5ty07o9riln0phm/konkrete_neoforge_1.9.9_MC_1.21.jar?rlkey=9xn9v65zxdq0svowy66txzlwo&st=982egee8&dl=1"

set "fileName[99]=kotlinforforge-5.12.0-all.jar"
set "modURL[99]=https://www.dropbox.com/scl/fi/g6om1ze8xbv0py68w8fst/kotlinforforge-5.12.0-all.jar?rlkey=m9rt40tg5tcara9g9ac8vshp6&st=f4ojtqsr&dl=1"

set "fileName[100]=KotlinLangForge-2.18.0-k2.4.21-3.0+neoforge.jar"
set "modURL[100]=https://www.dropbox.com/scl/fi/d1c07fimol17l5x4444hj/KotlinLangForge-2.18.0-k2.4.21-3.0-neoforge.jar?rlkey=1p9cdhejl6qaev5cycxra3c7w&st=i9hhyi9t&dl=1"

set "fileName[101]=L_Ender's Cataclysm 1.21.1-3.33.jar"
set "modURL[101]=https://www.dropbox.com/scl/fi/mh6qdahdsmnpuf429by1r/L_Ender-s-Cataclysm-1.21.1-3.33.jar?rlkey=6kpg5vpcmhwlge34prtwhqqsl&st=k277cjqb&dl=1"

set "fileName[102]=lendersdelight-1.21.1-1.0.10b.jar"
set "modURL[102]=https://www.dropbox.com/scl/fi/5g3dky96jjv3kis1qg034/lendersdelight-1.21.1-1.0.10b.jar?rlkey=limqc8jceaj86jz8p3iaddt9n&st=40idgyl8&dl=1"

set "fileName[103]=libraryferret-neoforge-1.21.1-4.0.0.jar"
set "modURL[103]=https://www.dropbox.com/scl/fi/s4wiylel4vcongn5ove0x/libraryferret-neoforge-1.21.1-4.0.0.jar?rlkey=w3bgyu5axx8a8rgirggp5h4qx&st=9w1vhcd4&dl=1"

set "fileName[104]=lionfishapi-3.1.jar"
set "modURL[104]=https://www.dropbox.com/scl/fi/weufsv0oms5mppq37hkq2/lionfishapi-3.1.jar?rlkey=1fjjb952xiar50wenbxo3g6wg&st=3en0imzk&dl=1"

set "fileName[105]=lithium-neoforge-0.15.4+mc1.21.1.jar"
set "modURL[105]=https://www.dropbox.com/scl/fi/1ib5ddqmkubvccpfj9gz5/lithium-neoforge-0.15.4-mc1.21.1.jar?rlkey=gk3exoed5th7l3zpv8v86j1km&st=ds71mdp6&dl=1"

set "fileName[106]=lithostitched-1.8.1-neoforge-21.1.jar"
set "modURL[106]=https://www.dropbox.com/scl/fi/3e7vlh2hwxs24ud6cei71/lithostitched-1.8.1-neoforge-21.1.jar?rlkey=4uflgvosp3iqe24cmhf357dy1&st=1ugs8ugg&dl=1"

set "fileName[107]=logbegone-neoforge-1.21.1-1.0.3.jar"
set "modURL[107]=https://www.dropbox.com/scl/fi/zxnwyu1upo7amxrlxcpth/logbegone-neoforge-1.21.1-1.0.3.jar?rlkey=4qxxhj6mp2si1ofuwdvzw0vuu&st=xixjctxg&dl=1"

set "fileName[108]=mcacapitals-1.3.5.jar"
set "modURL[108]=https://www.dropbox.com/scl/fi/q6l07ja0lqz7f74nover9/mcacapitals-1.3.5.jar?rlkey=t1szcf1uuewefmeuttv9v1256&st=akwpsyqk&dl=1"

set "fileName[109]=mca-neoforge-7.7.36-beta.3+1.21.1.jar"
set "modURL[109]=https://www.dropbox.com/scl/fi/33ut7t1lnwujypgvwkuzm/mca-neoforge-7.7.36-beta.3-1.21.1.jar?rlkey=sr91t0e8274kllz2zkeljj2w1&st=y9ypbbye&dl=1"

set "fileName[110]=mezz_config-1.21.1-neoforge-0.6.11-standalone.jar"
set "modURL[110]=https://www.dropbox.com/scl/fi/law97wmftgd71a0s5l2ck/mezz_config-1.21.1-neoforge-0.6.11-standalone.jar?rlkey=v1lobfmoxkpats7agt2idiaa9&st=yuug2uew&dl=1"

set "fileName[111]=naturalist-2.0.7-neoforge-1.21.1.jar"
set "modURL[111]=https://www.dropbox.com/scl/fi/lj248p9fkr4pizs12l1fe/naturalist-2.0.7-neoforge-1.21.1.jar?rlkey=99z2icnzd50q19pagie0xrdcv&st=71p2ru9s&dl=1"

set "fileName[112]=OctoLib-NEOFORGE-0.6.2+1.21.jar"
set "modURL[112]=https://www.dropbox.com/scl/fi/difq4blwwzz3pjn05t2tx/OctoLib-NEOFORGE-0.6.2-1.21.jar?rlkey=jw9z3i5r5q6yglvixr1a9j7zc&st=2yd7ngbh&dl=1"

set "fileName[113]=owo-lib-neoforge-0.12.15.6-beta.1+1.21.jar"
set "modURL[113]=https://www.dropbox.com/scl/fi/44t97bhnvyzioyupdtuif/owo-lib-neoforge-0.12.15.6-beta.1-1.21.jar?rlkey=xohds7g7hy3myl3rto10yljqa&st=q7tx01si&dl=1"

set "fileName[114]=Patchouli-1.21.1-93-NEOFORGE.jar"
set "modURL[114]=https://www.dropbox.com/scl/fi/sbhnj7wxueudnoc1wmuy4/Patchouli-1.21.1-93-NEOFORGE.jar?rlkey=cvujpjkzvcpal7v9ouiztjf2s&st=wjs8zf0v&dl=1"

set "fileName[115]=pet_cemetery-1.21.1-3.0.1.jar"
set "modURL[115]=https://www.dropbox.com/scl/fi/45rahdbzsd7wcd2840m89/pet_cemetery-1.21.1-3.0.1.jar?rlkey=4h78ir1ixx7mxk58rei7a7vb3&st=ok0cxv0q&dl=1"

set "fileName[116]=Placebo-1.21.1-9.9.4.jar"
set "modURL[116]=https://www.dropbox.com/scl/fi/syvvestb0tkwi4dlh0aut/Placebo-1.21.1-9.9.4.jar?rlkey=5yo7ruk5ycwz815wefev7uieh&st=4eb5aywh&dl=1"

set "fileName[117]=player-animation-lib-forge-2.0.4+1.21.1.jar"
set "modURL[117]=https://www.dropbox.com/scl/fi/w0t4zbcfrww90n7vg5s2k/player-animation-lib-forge-2.0.4-1.21.1.jar?rlkey=y3qxpghdeoelvo7rphpv5zsr8&st=m9ony2et&dl=1"

set "fileName[118]=PlayerAnimationLibNeoforge-1.1.6+mc.1.21.1.jar"
set "modURL[118]=https://www.dropbox.com/scl/fi/sqc4hv5skoosys4z8czae/PlayerAnimationLibNeoforge-1.1.6-mc.1.21.1.jar?rlkey=1oenrqw1hxtf9ompbafsalgx7&st=rklx1t7m&dl=1"

set "fileName[119]=polymorph-neoforge-1.1.0+1.21.1.jar"
set "modURL[119]=https://www.dropbox.com/scl/fi/8mymkwshv3nimoxua2syq/polymorph-neoforge-1.1.0-1.21.1.jar?rlkey=dmqzsy8u0dc9esic0adhmh64m&st=0hsbv62z&dl=1"

set "fileName[120]=prickle-neoforge-1.21.1-21.1.11.jar"
set "modURL[120]=https://www.dropbox.com/scl/fi/1srtcavlbovbql4nyh3ju/prickle-neoforge-1.21.1-21.1.11.jar?rlkey=k3l5wwqtggfm4uxszou5veez1&st=zi9f1y3h&dl=1"

set "fileName[121]=puzzleslib-v21.1.66-mc1.21.1+neoforge.jar"
set "modURL[121]=https://www.dropbox.com/scl/fi/24xgrxzfrije6j3huvlhg/puzzleslib-v21.1.66-mc1.21.1-neoforge.jar?rlkey=23pz39sqai58qo9c12pjfz6gp&st=t2dmg78x&dl=1"

set "fileName[122]=redirected-neoforge-1.0.0-1.21.1.jar"
set "modURL[122]=https://www.dropbox.com/scl/fi/blmh9uyl7a4wfmlgvg8lu/redirected-neoforge-1.0.0-1.21.1.jar?rlkey=t2jepaukwb81pjyxl0wjglq3y&st=gbixnfpl&dl=1"

set "fileName[123]=resourcefulconfig-neoforge-1.21-3.0.11.jar"
set "modURL[123]=https://www.dropbox.com/scl/fi/xye90rg7irlgph0oksqex/resourcefulconfig-neoforge-1.21-3.0.11.jar?rlkey=9kpmp4g8m8fc9ojx8b1kqmp80&st=ggrga522&dl=1"

set "fileName[124]=ritchiesprojectilelib-2.1.2+mc.1.21.1-neoforge.jar"
set "modURL[124]=https://www.dropbox.com/scl/fi/fr4f1t04xrpb32m8b23qn/ritchiesprojectilelib-2.1.2-mc.1.21.1-neoforge.jar?rlkey=96ivl4kzibvpuqm232p64lu5c&st=8gocpwcl&dl=1"

set "fileName[125]=sable_sa_compat-1.0.4.jar"
set "modURL[125]=https://www.dropbox.com/scl/fi/67z40yn2d3kfakq2c0cpe/sable_sa_compat-1.0.4.jar?rlkey=cww19ubewznw61bgnlc843ekl&st=qliiawk5&dl=1"

set "fileName[126]=sablecollisiondamage-1.0.8.jar"
set "modURL[126]=https://www.dropbox.com/scl/fi/gzeqqoxdwgl9sh7y530sm/sablecollisiondamage-1.0.8.jar?rlkey=sqo0vq8jsgaxbhn411nu3mqt7&st=69g5prfk&dl=1"

set "fileName[127]=sable-neoforge-1.21.1-2.0.6.jar"
set "modURL[127]=https://www.dropbox.com/scl/fi/qkcml4kr8qd0ulbhary5j/sable-neoforge-1.21.1-2.0.6.jar?rlkey=rdn5bcg3wrwmyi6re1677uieq&st=f6s6prne&dl=1"

set "fileName[128]=shuffle-neoforge-21.1.0.jar"
set "modURL[128]=https://www.dropbox.com/scl/fi/zfx0f4vdemzg0m62ipnym/shuffle-neoforge-21.1.0.jar?rlkey=7q8yxt1jvpfyw79hhtl7jztt4&st=aq5hk8et&dl=1"

set "fileName[129]=sliceanddice-4.3.4-neoforge.jar"
set "modURL[129]=https://www.dropbox.com/scl/fi/h6jrpsc5lnabfesf13ysy/sliceanddice-4.3.4-neoforge.jar?rlkey=bbnbh6qjypthxfmdyk6ovxd6t&st=zhpykuc9&dl=1"

set "fileName[130]=sneak_through_berries-neoforge-21.1.0.jar"
set "modURL[130]=https://www.dropbox.com/scl/fi/8vcn6bj8zqb0wgbus3i5d/sneak_through_berries-neoforge-21.1.0.jar?rlkey=4noxyhyjeok0biaioqqm8c7rl&st=mvtmohae&dl=1"

set "fileName[131]=sophisticatedbackpacks-1.21.1-3.26.20.2244.jar"
set "modURL[131]=https://www.dropbox.com/scl/fi/i94r3v9vnhszkkij4821o/sophisticatedbackpacks-1.21.1-3.26.20.2244.jar?rlkey=ci346sffui2dnpipioqyyvdtn&st=loqck3kg&dl=1"

set "fileName[132]=sophisticatedcore-1.21.1-1.5.28.2458.jar"
set "modURL[132]=https://www.dropbox.com/scl/fi/ydbqwna08w8y9yjj4vm24/sophisticatedcore-1.21.1-1.5.28.2458.jar?rlkey=sfx5grqmm2el53nbolf41uil8&st=z1guki2f&dl=1"

set "fileName[133]=sophisticatedstorage-1.21.1-1.6.16.2222.jar"
set "modURL[133]=https://www.dropbox.com/scl/fi/jdae5i83wjro04cv0te8m/sophisticatedstorage-1.21.1-1.6.16.2222.jar?rlkey=ulqqi3lqfcrurxf495llvjbui&st=10v9kgmk&dl=1"

set "fileName[134]=sound-physics-remastered-neoforge-1.21.1-1.5.2.jar"
set "modURL[134]=https://www.dropbox.com/scl/fi/xnxvd03xhklzxsvxn0jg7/sound-physics-remastered-neoforge-1.21.1-1.5.2.jar?rlkey=1oszxchefu2zzzn0ec6alo457&st=4ye8rcq7&dl=1"

set "fileName[135]=Sparkweave-NeoForge-0.510.0.jar"
set "modURL[135]=https://www.dropbox.com/scl/fi/tkd69x4w1jf2q09a0gtxs/Sparkweave-NeoForge-0.510.0.jar?rlkey=a4vj9lwzccy6rf6py10hqpyjs&st=1o29t8ng&dl=1"

set "fileName[136]=spear-backport-neoforge-1.8.0-1.21.1.jar"
set "modURL[136]=https://www.dropbox.com/scl/fi/elr1uuwqn7y8myutgqrn0/spear-backport-neoforge-1.8.0-1.21.1.jar?rlkey=9ag7rzjkcw0xjdr6v2a1fdoas&st=uopycq5h&dl=1"

set "fileName[137]=StreamsReflowing-1.21.1-neoforge-2.16.2.jar"
set "modURL[137]=https://www.dropbox.com/scl/fi/smhr0ksby0cmpw235zwyg/StreamsReflowing-1.21.1-neoforge-2.16.2.jar?rlkey=aoe3ou00c7rq7j00ota43wi3w&st=71nzorws&dl=1"

set "fileName[138]=supermartijn642configlib-1.1.8-neoforge-mc1.21.jar"
set "modURL[138]=https://www.dropbox.com/scl/fi/i2xio6cwcxdq3gjby78cq/supermartijn642configlib-1.1.8-neoforge-mc1.21.jar?rlkey=nut5yckp1tmyrgm6l2snpi0pm&st=3t2t04ww&dl=1"

set "fileName[139]=TerraBlender-neoforge-1.21.1-4.1.0.8.jar"
set "modURL[139]=https://www.dropbox.com/scl/fi/8cpe3ybvz93aacaruva5b/TerraBlender-neoforge-1.21.1-4.1.0.8.jar?rlkey=8ogo1duaehv3m7vcg61ioevtq&st=bug6f0p4&dl=1"

set "fileName[140]=tf_dnv-2.0.3.jar"
set "modURL[140]=https://www.dropbox.com/scl/fi/pyc8t613nceuzozq7fku2/tf_dnv-neoforge-2.0.3.jar?rlkey=2rp11cdx1pte9b3a8u3ifrahs&st=m087ly4o&dl=1"

set "fileName[141]=tfmg-1.21.1-1.3.3-community.jar"
set "modURL[141]=https://www.dropbox.com/scl/fi/hw5nzj2huqnudhsh8tk2l/tfmg-1.21.1-1.3.3-community.jar?rlkey=c2asgsi89gaf332g7kycul119&st=ufrcf1o2&dl=1"

set "fileName[142]=toms_storage-1.21-2.4.2.jar"
set "modURL[142]=https://www.dropbox.com/scl/fi/78kshw5bmym2rjnc86m55/toms_storage-1.21-2.4.2.jar?rlkey=er1u0eoh5cy9wlg8yapjnwy6c&st=bxeks037&dl=1"

set "fileName[143]=treeharvester-1.21.1-11.0.jar"
set "modURL[143]=https://www.dropbox.com/scl/fi/bui0pn5kjagzhly2mcx7g/treeharvester-1.21.1-11.0.jar?rlkey=s24des043gm1viqxb5jhn0t1m&st=xnaebi14&dl=1"

set "fileName[144]=tw-decorative-food-1.21.1-2.0.1-neoforge.jar"
set "modURL[144]=https://www.dropbox.com/scl/fi/g6gjdbf0lz9e0ujka3sgk/tw-decorative-food-1.21.1-2.0.1-neoforge.jar?rlkey=hf3hq3rv90vxke2poyfww588i&st=fte6uvzz&dl=1"

set "fileName[145]=twilightdelight-3.2.9.jar"
set "modURL[145]=https://www.dropbox.com/scl/fi/vaszqunmwmw9de3ntylqa/twilightdelight-3.2.9.jar?rlkey=t4t6grkwodtkbubmrw9jsd5a3&st=dvisl5v0&dl=1"

set "fileName[146]=twilightforest-1.21.1-4.8.3345-universal.jar"
set "modURL[146]=https://www.dropbox.com/scl/fi/k09wj6t3kuewv0ityqhvy/twilightforest-1.21.1-4.8.3345-universal.jar?rlkey=6k1c128lnc2roz99frci6qjt6&st=5975a3d4&dl=1"

set "fileName[147]=txnilib-neoforge-1.0.24-1.21.1.jar"
set "modURL[147]=https://www.dropbox.com/scl/fi/w2otvvn08rlwezhrmm7fq/txnilib-neoforge-1.0.24-1.21.1.jar?rlkey=ac4kdh0y99wv5fe2y3uizxh7z&st=yd9qsvmz&dl=1"

set "fileName[148]=underlay-1.0.5-neoforge-mc1.21.1.jar"
set "modURL[148]=https://www.dropbox.com/scl/fi/2de8xmo4rxe5zf2f7sfff/underlay-1.0.5-neoforge-mc1.21.1.jar?rlkey=aw9je1dxoont67cbd3091aeph&st=pmpr1emb&dl=1"

set "fileName[149]=uranus-3.0-beta.1.jar"
set "modURL[149]=https://www.dropbox.com/scl/fi/cf83csu60lnzmil4kd4e4/uranus-3.0-beta.1.jar?rlkey=3varsa13obyjwx5mh6vva7fu5&st=hyx08xhh&dl=1"

set "fileName[150]=veil-neoforge-1.21.1-4.5.2.jar"
set "modURL[150]=https://www.dropbox.com/scl/fi/xkwdhwkwjidr0dkxv4q3e/veil-neoforge-1.21.1-4.5.2.jar?rlkey=6hlz7c6kfhuoaxl8xmfmuy4wt&st=apuqqsum&dl=1"

set "fileName[151]=veinminer-neoforge-2.11.2+1.21.1.jar"
set "modURL[151]=https://www.dropbox.com/scl/fi/nugv3gk3vykzz5hwhv1tu/veinminer-neoforge-2.11.2-1.21.1.jar?rlkey=bfky8s1t6g344a60g36rtgxf7&st=ck7ulgfc&dl=1"

set "fileName[152]=watut-neoforge-1.21.0-1.2.7.jar"
set "modURL[152]=https://www.dropbox.com/scl/fi/sjfn2bqcrttp0rk2agore/watut-neoforge-1.21.0-1.2.7.jar?rlkey=yvrbiklbvtyk3m4izhxsslinw&st=gy11bw5d&dl=1"

set "fileName[153]=Waves-1.21.x-1.6.jar"
set "modURL[153]=https://www.dropbox.com/scl/fi/eq0xnshkmuznf1x35r8yq/Waves-1.21.x-1.6.jar?rlkey=6lbi4baxgjcwdch9jw86okmsj&st=cyghsn3x&dl=1"

set "fileName[154]=waystones-neoforge-1.21.1-21.1.46.jar"
set "modURL[154]=https://www.dropbox.com/scl/fi/or0cc5785lqi1aekulr19/waystones-neoforge-1.21.1-21.1.46.jar?rlkey=8pwo1brv3ppf21m4fp226k1w7&st=w0yqeehi&dl=1"

set "fileName[155]=waystonessable-1.0.7.jar"
set "modURL[155]=https://www.dropbox.com/scl/fi/31jogvn1ed6xtcwmz4tqp/waystonessable-1.0.7.jar?rlkey=owcfth74sf53jgxn2io4t8fy2&st=if2o7829&dl=1"

set "fileName[156]=woodworks-1.21.1-4.0.2.jar"
set "modURL[156]=https://www.dropbox.com/scl/fi/0v6srtz4hhbr8t21ndguk/woodworks-1.21.1-4.0.2.jar?rlkey=66kacmlh5gh7c5p2kgvyxclv7&st=99nfoi5d&dl=1"

set "fileName[157]=wwoo-neoforge-2.6.7.jar"
set "modURL[157]=https://www.dropbox.com/scl/fi/31t9wtj2s9w6x2pfg5c8l/wwoo-neoforge-2.6.7.jar?rlkey=2f4tncl5urtkufdchyyxrkzig&st=egszwmbf&dl=1"

set "fileName[158]=yet_another_config_lib_v3-3.8.2+1.21.1-neoforge.jar"
set "modURL[158]=https://www.dropbox.com/scl/fi/kb8i85z6tauu7t70xhxn0/yet_another_config_lib_v3-3.8.2-1.21.1-neoforge.jar?rlkey=m802ogttcc8kt2cozszpvei8s&st=msgx33qz&dl=1"

set "fileName[159]=better_weaponry-1.1.3-neoforge-1.21.1.jar"
set "modURL[159]=https://www.dropbox.com/scl/fi/fxbmbpf5e71924w2s4rf1/better_weaponry-1.1.3-neoforge-1.21.1.jar?rlkey=g74pn6h1wvw9n7aif164gmshj&st=atv8kmnu&dl=1"

set "fileName[160]=expcounter-1.21.1-neoforge-2.6.jar"
set "modURL[160]=https://www.dropbox.com/scl/fi/ujk6nw7ylutp6fh5s23zp/expcounter-1.21.1-neoforge-2.6.jar?rlkey=w64aelzffuyy2jakof04dcicx&st=peyseqny&dl=1"

set "fileName[161]=explosive-enhancement-1.3.2-1.21-1.21.1.jar"
set "modURL[161]=https://www.dropbox.com/scl/fi/aqd7634ag3iqjzvyzjcbd/explosive-enhancement-1.3.2-1.21-1.21.1.jar?rlkey=e6fwlpk7yiem2bei38zfj8dxt&st=e0ce68go&dl=1"

set "fileName[162]=ImmediatelyFast-NeoForge-1.6.15+1.21.1.jar"
set "modURL[162]=https://www.dropbox.com/scl/fi/v2uc9q35ld5i4lk10n5dm/ImmediatelyFast-NeoForge-1.6.15-1.21.1.jar?rlkey=tbohbmocqb3js4k58rpa1sp5w&st=dh74yx7t&dl=1"

set "fileName[163]=immersiveoverlays-1.8.6+1.21.1-neoforge.jar"
set "modURL[163]=https://www.dropbox.com/scl/fi/uk9x497epnfbph5kn3mtx/immersiveoverlays-1.8.6-1.21.1-neoforge.jar?rlkey=4h8tmi49u8zxqqturk5p169yt&st=3gits24v&dl=1"

set "fileName[164]=ImmersiveUI-NEOFORGE-0.3.3+1.21.1.jar"
set "modURL[164]=https://www.dropbox.com/scl/fi/qdzgo8yicw5ghii7swej3/ImmersiveUI-NEOFORGE-0.3.3-1.21.1.jar?rlkey=u2ho4upak1ahh8an0hkbxygzl&st=emd3fhm2&dl=1"

set "fileName[165]=iris-flywheel-compat-NeoForge-2.4.0.jar"
set "modURL[165]=https://www.dropbox.com/scl/fi/1sofg7v6rezoxf52to1nx/iris-flywheel-compat-NeoForge-2.4.0.jar?rlkey=u5p7opul8wbu0cvhmkgyoa52u&st=0s0yu3c5&dl=1"

set "fileName[166]=iris-neoforge-1.8.14-beta.1+mc1.21.1.jar"
set "modURL[166]=https://www.dropbox.com/scl/fi/q48pb93cfg14hfrhmk4zs/iris-neoforge-1.8.14-beta.1-mc1.21.1.jar?rlkey=edkbir9r7p3z7496bls5tx9dm&st=ryhkbscx&dl=1"

set "fileName[167]=JustEnoughResources-NeoForge-1.21.1-1.6.0.57.jar"
set "modURL[167]=https://www.dropbox.com/scl/fi/aytq6wuzc1a78zpjqkm4b/JustEnoughResources-NeoForge-1.21.1-1.6.0.57.jar?rlkey=jfpnds30qh93biu93zocmn6kk&st=fwiokj4n&dl=1"

set "fileName[168]=justzoom_neoforge_3.1.0_MC_1.21.1.jar"
set "modURL[168]=https://www.dropbox.com/scl/fi/7c5iucvqrxuodjxzl2m7d/justzoom_neoforge_3.1.0_MC_1.21.1.jar?rlkey=e4mytce7p68e9u6lfrjcgtqml&st=x0tpe9sg&dl=1"

set "fileName[169]=lootjournal-neoforge-1.3.0.jar"
set "modURL[169]=https://www.dropbox.com/scl/fi/8se9ycnsqobal9dxygigc/lootjournal-neoforge-1.3.0.jar?rlkey=ielcpfxwbapqcwcx9k7f53hx5&st=0ekqojo6&dl=1"

set "fileName[170]=MouseTweaks-neoforge-mc1.21-2.26.1.jar"
set "modURL[170]=https://www.dropbox.com/scl/fi/q56wx49gdxe8qn5yxgfqu/MouseTweaks-neoforge-mc1.21-2.26.1.jar?rlkey=bw10hko2l493f7hqclkhspq4c&st=25cdjjz1&dl=1"

set "fileName[171]=nemos-inventory-sorting-NeoForge-1.21.1-1.8.2.1.jar"
set "modURL[171]=https://www.dropbox.com/scl/fi/k8bd4d4ipyjd14ierftpa/nemos-inventory-sorting-NeoForge-1.21.1-1.8.2.1.jar?rlkey=2wjpbeqggwve20391o6pf35yn&st=salyu2v7&dl=1"

set "fileName[172]=obscure_tooltips-neoforge-1.21.1-4.2.5.jar"
set "modURL[172]=https://www.dropbox.com/scl/fi/5j6484bb0w8uig5w6qut3/obscure_tooltips-neoforge-1.21.1-4.2.5.jar?rlkey=ys43p47zo7p0qe5sn8lphod30&st=5idz9112&dl=1"

set "fileName[173]=OverflowingBars-v21.1.1-1.21.1-NeoForge.jar"
set "modURL[173]=https://www.dropbox.com/scl/fi/u16cc5bw6oz70s6b9341w/OverflowingBars-v21.1.1-1.21.1-NeoForge.jar?rlkey=r7cb0vp0uro5ezo4rr9be6osz&st=840m0pf1&dl=1"

set "fileName[174]=sablejade-1.3.0.jar"
set "modURL[174]=https://www.dropbox.com/scl/fi/a05aygetjycx0ipycf00b/sablejade-1.3.0.jar?rlkey=ed1bepdqpj4ry8huhfnx7xsnt&st=4r812dgz&dl=1"

set "fileName[175]=smoothswapping-0.9.3.2-1.21.1-neoforge.jar"
set "modURL[175]=https://www.dropbox.com/scl/fi/n2eptx76vlpvraqhw8cp4/smoothswapping-0.9.3.2-1.21.1-neoforge.jar?rlkey=mgo3ui2eo6g4wc57yu1a6tryc&st=zj1htjtx&dl=1"

set "fileName[176]=sodium-neoforge-0.8.13+mc1.21.1.jar"
set "modURL[176]=https://www.dropbox.com/scl/fi/ndc780gghxud1ln5rmxju/sodium-neoforge-0.8.13-mc1.21.1.jar?rlkey=0dydw639dnkcp9q8t1vzi0u9g&st=z3d7pupb&dl=1"

set "fileName[177]=spatial-gui-1.10.1+1.21.1-neoforge.jar"
set "modURL[177]=https://www.dropbox.com/scl/fi/196rl4hyfx5oxdj6u1q01/spatial-gui-1.10.1-1.21.1-neoforge.jar?rlkey=ekm7k6snyzzfbui4rpsu3yu3f&st=l3pc0pdj&dl=1"

set "fileName[178]=studious-keybinds-neoforge-1.21.1-1.0.8-beta.1.jar"
set "modURL[178]=https://www.dropbox.com/scl/fi/2t4phk0mjbxg297t64ql4/studious-keybinds-neoforge-1.21.1-1.0.8-beta.1.jar?rlkey=5ir29qlv34lu3w9qcrii1vb42&st=x1hoseji&dl=1"

set "fileName[178]=createlanterns-beta-21.29.jar"
set "modURL[178]=https://www.dropbox.com/scl/fi/28rfzx48aj3edrp9wzz5m/createlanterns-beta-21.29.jar?rlkey=egm3030tirxte58pey494h08h&st=3tqr6b1x&dl=1"

set DEL_COUNT=2
 
set "DEL_FILE[1]=sample1.jar"
set "DEL_FILE[2]=sample2.jar"

where curl >nul 2>&1
if errorlevel 1 (
    echo dl mo curl
   echo https://curl.se/download.html
    echo.
    pause
    exit /b 1
)
echo  1. Scanning duplicates and/or files that are not in the server...
set /a d=1
:FORCEDEL_LOOP
if !d! GTR %DEL_COUNT% goto :FORCEDEL_DONE
    set "DNAME=!DEL_FILE[%d%]!"
    if exist "!DNAME!" (
       echo  [DELETE - Blacklist]  !DNAME!
      del /f /q "!DNAME!"
    )
    set /a d+=1
goto :FORCEDEL_LOOP
:FORCEDEL_DONE
set "ALLOWLIST=%TEMP%\mc_allow_%RANDOM%.txt"
set /a _w=1
:WRITE_ALLOWLIST
if !_w! GTR %modAmount% goto :WRITE_ALLOWLIST_DONE
   echo !fileName[%_w%]!>> "!ALLOWLIST!"
  set /a _w+=1
goto :WRITE_ALLOWLIST
:WRITE_ALLOWLIST_DONE
set DELETED_COUNT=0
for %%F in (*.jar) do (
    if not exist "%%F\" (
    findstr /i /x /c:"%%F" "!ALLOWLIST!" >nul 2>&1
        if errorlevel 1 (
          powershell -NoProfile -Command "Write-Host '	[' -NoNewline; Write-Host 'DELETED' -ForegroundColor Red -NoNewline; Write-Host '] %%FF'"
         del /f /q "%%F"
            set /a DELETED_COUNT+=1
        )
    )
)
if exist "!ALLOWLIST!" del /f /q "!ALLOWLIST!"
if !DELETED_COUNT! EQU 0 (
echo 	No .jar files found.
)
echo  2. Checking for missing mods...
set MISSING_COUNT=0
set /a i=1
:CHECK_LOOP
if !i! GTR %modAmount% goto :CHECK_DONE
    set "FNAME=!fileName[%i%]!"
    set "FURL=!modURL[%i%]!"
    if not exist "!FNAME!" (
        powershell -NoProfile -Command "Write-Host '	[' -NoNewline; Write-Host 'MISSING' -ForegroundColor Red -NoNewline; Write-Host '] !FNAME!'"
        set /a MISSING_COUNT+=1
        echo 		===========================================================
        echo 		^|^| %% Total ^|^| Avg Download ^|^| Upload Speed ^|^| Time Spent ^|^|
        echo 		===========================================================
        curl -L -s --show-error -o "!FNAME!" -w "%%{speed_download} %%{time_total}" "!FURL!" > "%TEMP%\curlstat.txt"
        if errorlevel 1 (
            echo Failed to download !FNAME!
        ) else (
            for /f "tokens=1,2" %%A in (%TEMP%\curlstat.txt) do (
           powershell -NoProfile -Command "$spd=[double]'%%A'/1MB; $sec=[int][double]'%%B'; $ts=[timespan]::FromSeconds($sec); Write-Host ('		||   100%%  || ' + '  '+           $spd.ToString('F2') + ' Mbps  ||  0.00 Mbps   ||   ' + ($ts.ToString('mm\:ss')) + '    ||')"
            )
            echo 		===========================================================
            powershell -NoProfile -Command "Write-Host '	[' -NoNewline; Write-Host 'DONE' -ForegroundColor Green -NoNewline; Write-Host '] !FNAME!'"
        )
    ) else (
        echo 	[OK]  !FNAME!
    )
    set /a i+=1
goto :CHECK_LOOP
:CHECK_DONE
 
if !MISSING_COUNT! EQU 0 (
powershell "Write-Host '[' -NoNewline; Write-Host 'Not Missing any Mods' -ForegroundColor Green -NoNewline; Write-Host ']'"
)
powershell "Write-Host '[' -NoNewline; Write-Host 'Modlist Downloader Finished' -ForegroundColor Green -NoNewline; Write-Host ']'"
timeout /t 10
del /f /q "%~0"