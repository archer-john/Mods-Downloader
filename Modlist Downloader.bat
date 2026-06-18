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
set modAmount=160
set "fileName[1]=accessories-neoforge-1.1.0-beta.53-1.21.1.jar"
set "modURL[1]=https://www.dropbox.com/scl/fi/gahvznopeykflb3kere1b/accessories-neoforge-1.1.0-beta.53-1.21.1.jar?rlkey=j1vol7dpzx9dvddg4kr83juv0&st=rn1s5v36&dl=1"
 
set "fileName[2]=aces_spell_utils-1.2.6.1-1.21.1.jar"
set "modURL[2]=https://www.dropbox.com/scl/fi/omq0g2hebkhu7iv87qqgw/aces_spell_utils-1.2.6.1-1.21.1.jar?rlkey=gtd80p3tfr7xr1olqlgzn0ull&st=f98xawdm&dl=1"
 
set "fileName[3]=adorablehamsterpets-3.6.0-1.21.1-neoforge.jar"
set "modURL[3]=https://www.dropbox.com/scl/fi/42hhs2i6mjlrfafqqcwdc/adorablehamsterpets-3.6.0-1.21.1-neoforge.jar?rlkey=oxn64e8virbnm9qe2cz2wruvn&st=uvfvjdcn&dl=1"
 
set "fileName[4]=aeronauticscompat-1.1.2.jar"
set "modURL[4]=https://www.dropbox.com/scl/fi/8wrwx3hafl23e77l1ro5d/aeronauticscompat-1.1.2.jar?rlkey=j7te8ap5ascbzkqiqm7fbggre&st=w8a0edpc&dl=1"
 
set "fileName[5]=aether-1.21.1-1.5.10-neoforge.jar"
set "modURL[5]=https://www.dropbox.com/scl/fi/18a9lvzfbd7e3dlzbnrik/aether-1.21.1-1.5.10-neoforge.jar?rlkey=t3ugly0rg8zdstc97c3hbwg9b&st=6a4zle6z&dl=1"
 
set "fileName[6]=aether-ruined-portal-3.4.jar"
set "modURL[6]=https://www.dropbox.com/scl/fi/r5hbqcjn5yizrhw72jqo6/aether-ruined-portal-3.4.jar?rlkey=595gbstcsv64f8nn01y7rd6ox&st=rwexkad5&dl=1"
 
set "fileName[7]=AetherVillages-1.21.1-1.0.8-neoforge.jar"
set "modURL[7]=https://www.dropbox.com/scl/fi/u42z04xfax5ysl7gftdrc/AetherVillages-1.21.1-1.0.8-neoforge.jar?rlkey=extub32eideybab437a2ay452&st=8bhwba24&dl=1"
 
set "fileName[8]=alexscaves-2.0.10.jar"
set "modURL[8]=https://www.dropbox.com/scl/fi/d8xngc3w9lfz137vmxgxj/alexscaves-2.0.10.jar?rlkey=re4qtvbpdnq8uk8qnlv8s84re&st=6wlrxaxr&dl=1"
 
set "fileName[9]=alexsmobs-1.22.17.jar"
set "modURL[9]=https://www.dropbox.com/scl/fi/998xf4yy1s8yb00r2jj67/alexsmobs-1.22.17.jar?rlkey=6kfu9dccn6q67f01olj773pn0&st=3kqho2qf&dl=1"
 
set "fileName[10]=Apotheosis-1.21.1-8.5.4.jar"
set "modURL[10]=https://www.dropbox.com/scl/fi/56ol60ym3lba5nrt23yhv/Apotheosis-1.21.1-8.5.4.jar?rlkey=f7e0l3bi1qzd7zyssty0hpt05&st=6uqxsu2s&dl=1"
 
set "fileName[11]=ApothicAttributes-1.21.1-2.9.1.jar"
set "modURL[11]=https://www.dropbox.com/scl/fi/mcj7pgn0fx6hnuhpbzmrq/ApothicAttributes-1.21.1-2.9.1.jar?rlkey=qjef74tyqinngunve11phai06&st=ff29wrem&dl=1"
 
set "fileName[12]=apothiccombat-1.2.1.jar"
set "modURL[12]=https://www.dropbox.com/scl/fi/5fpgqrbvbyaibomacskmo/apothiccombat-1.2.1.jar?rlkey=53dn9h97pgowtq3i21ksjn9c7&st=glu2tkuv&dl=1"
 
set "fileName[13]=ApothicEnchanting-1.21.1-1.5.3.jar"
set "modURL[13]=https://www.dropbox.com/scl/fi/61ffw5e0je83m19cgp083/ApothicEnchanting-1.21.1-1.5.3.jar?rlkey=6haqpqt6yzcnp48bprlektfs3&st=cwq7vf6y&dl=1"
 
set "fileName[14]=ApothicSpawners-1.21.1-1.3.4.jar"
set "modURL[14]=https://www.dropbox.com/scl/fi/1rk4c43q3cca0ap8s1qdf/ApothicSpawners-1.21.1-1.3.4.jar?rlkey=wloq1otoae9ow09powztgebvg&st=79s59ldr&dl=1"
 
set "fileName[15]=appleskin-neoforge-mc1.21-3.0.9.jar"
set "modURL[15]=https://www.dropbox.com/scl/fi/n5e8yo7ttcf9shas5dfw4/appleskin-neoforge-mc1.21-3.0.9.jar?rlkey=784rleurbh5qbtngzdzn5ec49&st=gjtw8y4y&dl=1"
 
set "fileName[16]=arcaneessenceblock-1.0.1-neoforge-1.21.1.jar"
set "modURL[16]=https://www.dropbox.com/scl/fi/f37txt8z8qtwirf047cao/arcaneessenceblock-1.0.1-neoforge-1.21.1.jar?rlkey=uz81kg5bjj3iuhr79jtkhbmzj&st=zzi8nxri&dl=1"
 
set "fileName[17]=architectury-13.0.8-neoforge.jar"
set "modURL[17]=https://www.dropbox.com/scl/fi/7t3oh8nk6v694r28gqp9z/architectury-13.0.8-neoforge.jar?rlkey=pamw8tlktv66uhmyhzd42smik&st=f2ywvi30&dl=1"
 
set "fileName[18]=azurelib-neo-1.21.1-3.1.8.jar"
set "modURL[18]=https://www.dropbox.com/scl/fi/8m5ugej1svzorf76vxndy/azurelib-neo-1.21.1-3.1.8.jar?rlkey=s7zrv7xgyqfb6vzg0lukklc2f&st=n3ad0vpp&dl=1"
 
set "fileName[19]=balm-neoforge-1.21.1-21.0.58.jar"
set "modURL[19]=https://www.dropbox.com/scl/fi/d0jl137hedcez3ycy1j9a/balm-neoforge-1.21.1-21.0.58.jar?rlkey=yenkrlehzpu99rrq52gmzezqz&st=oy1elbte&dl=1"
 
set "fileName[20]=bellsandwhistles-0.4.7-1.21.1.jar"
set "modURL[20]=https://www.dropbox.com/scl/fi/vy24f4wq3ltu8yaqio64z/bellsandwhistles-0.4.7-1.21.1.jar?rlkey=ltbl2333fw5ilmugvirg7clcl&st=byds2prk&dl=1"
 
set "fileName[21]=better_weaponry-1.1.3-neoforge-1.21.1.jar"
set "modURL[21]=https://www.dropbox.com/scl/fi/nvcpz98uq6ihu19wtmcp6/better_weaponry-1.1.3-neoforge-1.21.1.jar?rlkey=rb8e70qeoh8wo6lvlm5dfz8yl&st=oclipk55&dl=1"
 
set "fileName[22]=bettercombat-neoforge-2.3.2-1.21.1.jar"
set "modURL[22]=https://www.dropbox.com/scl/fi/360pmex0s6umcf5q8tswx/bettercombat-neoforge-2.3.2-1.21.1.jar?rlkey=mg3r17a7xwvx5l9mb72koed03&st=5dt2tqrq&dl=1"
 
set "fileName[23]=BetterF3-11.0.3-NeoForge-1.21.1.jar"
set "modURL[23]=https://www.dropbox.com/scl/fi/w6fxxml1tviu1kp9n1ajg/BetterF3-11.0.3-NeoForge-1.21.1.jar?rlkey=f3itxmml42hechyi3yej4ootb&st=xf6q0ayn&dl=1"
 
set "fileName[24]=bettervillage-neoforge-1.21.1-3.3.1.jar"
set "modURL[24]=https://www.dropbox.com/scl/fi/k1mggs05peq7vamvh2cuk/bettervillage-neoforge-1.21.1-3.3.1.jar?rlkey=3fvhvjqkyuw3u90x39ex9sd6d&st=glkdrqye&dl=1"
set "fileName[25]=blueprint-1.21.1-8.1.0.jar"
set "modURL[25]=https://www.dropbox.com/scl/fi/69f3z0my42dh6vebwo3ak/blueprint-1.21.1-8.1.0.jar?rlkey=nyextnujelikr9432zdg78arf&st=yng0k36n&dl=1"

set "fileName[26]=bookshelf-neoforge-1.21.1-21.1.81.jar"
set "modURL[26]=https://www.dropbox.com/scl/fi/ejqlgzycx8tkioxz713nr/bookshelf-neoforge-1.21.1-21.1.81.jar?rlkey=4epxknrpwpixt6jzx0yjm0e51&st=c9rya19w&dl=1"

set "fileName[27]=caelus-neoforge-7.0.1-1.21.1.jar"
set "modURL[27]=https://www.dropbox.com/scl/fi/kkomhbtfxf4cg9tfu08r7/caelus-neoforge-7.0.1-1.21.1.jar?rlkey=sjj5v4sq77uz52fqnjzjqwvp5&st=7p2vivw9&dl=1"
 
set "fileName[28]=carryon-neoforge-1.21.1-2.2.4.4.jar"
set "modURL[28]=https://www.dropbox.com/scl/fi/rbdhdble4ok8ennfxy5y3/carryon-neoforge-1.21.1-2.2.4.4.jar?rlkey=qsqp6d7picjpvqd2vuhx3o84p&st=78xx78g7&dl=1"
 
set "fileName[29]=cataclysm_spellbooks-1.1.11-1.21.jar"
set "modURL[29]=https://www.dropbox.com/scl/fi/d9glisj3yxyhf1aryesk7/cataclysm_spellbooks-1.1.11-1.21.jar?rlkey=bkjj5nf7u1e9enp65v29ajkup&st=dyqm87gz&dl=1"
 
set "fileName[30]=citadel-1.21.1-2.7.6.jar"
set "modURL[30]=https://www.dropbox.com/scl/fi/352yey7cnnlp46ph636sd/citadel-1.21.1-2.7.6.jar?rlkey=z49frv9rxf5p7hafxbhroziyy&st=s15xf2t2&dl=1"
 
set "fileName[31]=clayworks-1.21.1-4.0.3.jar"
set "modURL[31]=https://www.dropbox.com/scl/fi/gmdbuxvbkwy2accg04bcs/clayworks-1.21.1-4.0.3.jar?rlkey=8f8t2luintq2szfm3az00fsqh&st=9m0pykod&dl=1"
set "fileName[32]=cloth-config-15.0.140-neoforge.jar"
set "modURL[32]=https://www.dropbox.com/scl/fi/r34p09qoa81hxhtyxxtca/cloth-config-15.0.140-neoforge.jar?rlkey=rcj2wt8gg19xdbmawxxqu7pol&st=9bhja8td&dl=1"
 
set "fileName[33]=collective-1.21.1-8.25.jar"
set "modURL[33]=https://www.dropbox.com/scl/fi/0u5tw741an9motk3ubfuq/collective-1.21.1-8.25.jar?rlkey=qgdbxirz0jxng5rx2ovr6fgv5&st=u6vg6zch&dl=1"
 
set "fileName[34]=combat_roll-neoforge-2.0.6-1.21.1.jar"
set "modURL[34]=https://www.dropbox.com/scl/fi/k818f7zva6ckhplbwqnh7/combat_roll-neoforge-2.0.6-1.21.1.jar?rlkey=5v9xjxng9r5f2tm1lt47xcvd6&st=o0dskk04&dl=1"
 
set "fileName[35]=connector-2.0.0-beta.14-1.21.1-full.jar"
set "modURL[35]=https://www.dropbox.com/scl/fi/001fwvp23aa1h3391gjdl/connector-2.0.0-beta.14-1.21.1-full.jar?rlkey=fb39vpiyscl2hzu3wppgxd9fd&st=002goyw0&dl=1"
 
set "fileName[36]=ConnectorExtras-1.12.1-1.21.1.jar"
set "modURL[36]=https://www.dropbox.com/scl/fi/1xvo9ezj86m0a48db0uf7/ConnectorExtras-1.12.1-1.21.1.jar?rlkey=ki7cjiiylpnxnqcpax5rloao5&st=ovjso2vy&dl=1"
 
set "fileName[37]=copycats-3.0.4-mc.1.21.1-neoforge.jar"
set "modURL[37]=https://www.dropbox.com/scl/fi/mrl84drvdzb8im327zus9/copycats-3.0.4-mc.1.21.1-neoforge.jar?rlkey=7dujebxlure568gx7agx1sff6&st=0zwd69hh&dl=1"
 
set "fileName[38]=coroutil-neoforge-1.21.0-1.3.8.jar"
set "modURL[38]=https://www.dropbox.com/scl/fi/tz2xx5cb3uwjrxiox6spb/coroutil-neoforge-1.21.0-1.3.8.jar?rlkey=kavvui0s7gphz1pstbgcuyx9s&st=1ilst6ml&dl=1"
 
set "fileName[39]=craftableenchantedgoldenapple-1.21.1-0.1.jar"
set "modURL[39]=https://www.dropbox.com/scl/fi/ugk5fqzwf4hylmelgvq3i/craftableenchantedgoldenapple-1.21.1-0.1.jar?rlkey=juts1qbkj8zwv62p05zmffa82&st=vdgxbta0&dl=1"
 
set "fileName[40]=Create-Encased-1.21.1-1.8.1-ht1.jar"
set "modURL[40]=https://www.dropbox.com/scl/fi/mlxuqlgiec4blduxlp0z8/Create-Encased-1.21.1-1.8.1-ht1.jar?rlkey=tlw6sx50a5bjlb2adumaevlkb&st=q89q62om&dl=1"
 
set "fileName[41]=create_connected-1.2.2-mc1.21.1.jar"
set "modURL[41]=https://www.dropbox.com/scl/fi/ydr8i5d2bw8rz8lh9s6cd/create_connected-1.2.2-mc1.21.1.jar?rlkey=s5wqjn7i0656djx3lxur195iw&st=t53iyvo4&dl=1"
set "fileName[42]=create_sophback_compat-1.0.jar"
set "modURL[42]=https://www.dropbox.com/scl/fi/vduuugwdjolrktqy1mawk/create_sophback_compat-1.0.jar?rlkey=387zyuc4475p4tepq0y38u1nu&st=xxyl5qw9&dl=1"
 
set "fileName[43]=create-1.21.1-6.0.10.jar"
set "modURL[43]=https://www.dropbox.com/scl/fi/sv7glfgopo5pa62nieht6/create-1.21.1-6.0.10.jar?rlkey=19ryr3wbchvo7eqf2t1u5fq48&st=pd1t3ujt&dl=1"
 
set "fileName[44]=create-aeronautics-bundled-1.21.1-1.2.1.jar"
set "modURL[44]=https://www.dropbox.com/scl/fi/lkhklmo799f0d1avdgbw7/create-aeronautics-bundled-1.21.1-1.2.1.jar?rlkey=e9jkhklt8upw1xkrd3gksels9&st=11d2vqts&dl=1"
 
set "fileName[45]=create-central-kitchen-2.5.0.jar"
set "modURL[45]=https://www.dropbox.com/scl/fi/tf3xyjt43tbtgv1c11rni/create-central-kitchen-2.5.0.jar?rlkey=jtuj5d8212zent2jsdt58545m&st=6ipc0a66&dl=1"
 
set "fileName[46]=create-stuff-additions1.21.1_v2.1.3.jar"
set "modURL[46]=https://www.dropbox.com/scl/fi/evnwdt6p76f0z2qqdn9ct/create-stuff-additions1.21.1_v2.1.3.jar?rlkey=a6znzj3mx8oqvzacwfsrogs92&st=m0i9x5lv&dl=1"
 
set "fileName[47]=createaddition-1.6.0.jar"
set "modURL[47]=https://www.dropbox.com/scl/fi/kxqkkw4kujykc5fipbu96/createaddition-1.6.0.jar?rlkey=z91k1luv3scenzqird1xx6mip&st=zyy9f4wy&dl=1"
 
set "fileName[48]=createbigcannons-5.11.6-mc.1.21.1.jar"
set "modURL[48]=https://www.dropbox.com/scl/fi/46uqnskypfr78cc19w3vd/createbigcannons-5.11.6-mc.1.21.1.jar?rlkey=i9ymldesyhnmphy9wy8uvp1xx&st=whm2mwfi&dl=1"
 
set "fileName[49]=createcontraptionterminals-1.21-1.3.0.jar"
set "modURL[49]=https://www.dropbox.com/scl/fi/jygmhka0vmopzkm84mckg/createcontraptionterminals-1.21-1.3.0.jar?rlkey=2dsa8x8dfbbz748e1f5c4ojrw&st=i824wwtm&dl=1"
 
set "fileName[50]=createdeco-2.1.3.jar"
set "modURL[50]=https://www.dropbox.com/scl/fi/h3t7igqdq0ruax61xfxqr/createdeco-2.1.3.jar?rlkey=m1sknudjn5rzmgxajta7d9trm&st=2ij8hjgf&dl=1"
 
set "fileName[51]=CreateDragonsPlus-1.11.2b.jar"
set "modURL[51]=https://www.dropbox.com/scl/fi/zwm373utbz26tv60gjf6z/CreateDragonsPlus-1.11.2b.jar?rlkey=l0q9lk3m2jn71kqkfhdeyj1sx&st=vc4fi6qt&dl=1"
 
set "fileName[52]=createnuclear-1.3.2-beta.3-neoforge.jar"
set "modURL[52]=https://www.dropbox.com/scl/fi/bejtup1z7yrumhi42v48g/createnuclear-1.3.2-beta.3-neoforge.jar?rlkey=thlxka83r8baidk5kj1wmu6ds&st=i66rkk3w&dl=1"
 
set "fileName[53]=cumulus_menus-1.21.1-2.0.8-neoforge.jar"
set "modURL[53]=https://www.dropbox.com/scl/fi/35cg37p67dkrnx9d5ugy8/cumulus_menus-1.21.1-2.0.8-neoforge.jar?rlkey=iaxnp1v4jfpg9naz0l8diqnvo&st=bdfk5y8p&dl=1"
 
set "fileName[54]=curios-neoforge-9.5.1-1.21.1.jar"
set "modURL[54]=https://www.dropbox.com/scl/fi/kvbyq4zez30ds6i797eub/curios-neoforge-9.5.1-1.21.1.jar?rlkey=4ucoivyhbekl5zw3q1rm26lrz&st=yy1od0fl&dl=1"
 
set "fileName[55]=deep_aether-1.21.1-1.1.5.1.jar"
set "modURL[55]=https://www.dropbox.com/scl/fi/n9slxbw31unss8m1ekehc/deep_aether-1.21.1-1.1.5.1.jar?rlkey=7l53tarnmgbcjvhpu3kqo44q6&st=qz4rfpc0&dl=1"
 
set "fileName[56]=DnDesires-1.21.1-2.3a-BETA.jar"
set "modURL[56]=https://www.dropbox.com/scl/fi/0e3bsybs61nyf76dwseu1/DnDesires-1.21.1-2.3a-BETA.jar?rlkey=wzavuf5yxpal3la4nc3xpmawg&st=tea0fqga&dl=1"
 
set "fileName[57]=do_a_barrel_roll-neoforge-3.7.3-1.21.jar"
set "modURL[57]=https://www.dropbox.com/scl/fi/30ft2kp09nbfhrtarbqo0/do_a_barrel_roll-neoforge-3.7.3-1.21.jar?rlkey=7xsvy4sdj4i0pflc6s4c4i60s&st=ylx5n0ke&dl=1"
 
set "fileName[58]=dungeons-and-taverns-v4.4.4.jar"
set "modURL[58]=https://www.dropbox.com/scl/fi/udvoq5hza3j3vlmrny2aa/dungeons-and-taverns-v4.4.4.jar?rlkey=3sxtwc42tb7btolz06z6u0g0p&st=5iic2hva&dl=1"
 
set "fileName[59]=durabilitytooltip-1.1.6-neoforge-mc1.21.jar"
set "modURL[59]=https://www.dropbox.com/scl/fi/87okdot9qjb9fkftp1oxl/durabilitytooltip-1.1.6-neoforge-mc1.21.jar?rlkey=cuvrmlilhpres8cs36d6wzfk2&st=fvider36&dl=1"
 
set "fileName[60]=EasyAnvils-v21.1.0-1.21.1-NeoForge.jar"
set "modURL[60]=https://www.dropbox.com/scl/fi/2szymb2gquxh8wyacat7a/EasyAnvils-v21.1.0-1.21.1-NeoForge.jar?rlkey=gfhrq2q5h6v5i1nye0fa49acj&st=z6u8jz7n&dl=1"
 
set "fileName[61]=EasyShulkerBoxes-v21.1.3-1.21.1-NeoForge.jar"
set "modURL[61]=https://www.dropbox.com/scl/fi/sl8azr4di428cudan355h/EasyShulkerBoxes-v21.1.3-1.21.1-NeoForge.jar?rlkey=ie3ddugkfp1hoe3haw1q6vj1g&st=skts6254&dl=1"
set "fileName[62]=enchdesc-neoforge-1.21.1-21.1.9.jar"
set "modURL[62]=https://www.dropbox.com/scl/fi/uh1gpwi1qa3uvu9ksepcm/enchdesc-neoforge-1.21.1-21.1.9.jar?rlkey=mb1lk8rsd6t26oh3qc3trf1lf&st=fxz15s63&dl=1"
set "fileName[63]=endersdelight-1.3.0.jar"
set "modURL[63]=https://www.dropbox.com/scl/fi/1k6v35b2e8w4laaompwxd/endersdelight-1.3.0.jar?rlkey=dz2ogzp90v3cj1wpatqbdcjuv&st=qmoh99w9&dl=1"
 
set "fileName[64]=entity_model_features-3.2.4-1.21-neoforge.jar"
set "modURL[64]=https://www.dropbox.com/scl/fi/lo8q9hhf47uprsox3db05/entity_model_features-3.2.4-1.21-neoforge.jar?rlkey=jlj4gk0u0aoj9oxu1zlpshs5z&st=pjfxm2um&dl=1"
 
set "fileName[65]=entity_texture_features_1.21-neoforge-7.1.jar"
set "modURL[65]=https://www.dropbox.com/scl/fi/btstrhnx7snocfxshvnc7/entity_texture_features_1.21-neoforge-7.1.jar?rlkey=52lflbut0hwwfezk8q0f1vbvy&st=b6kkl1ad&dl=1"
 
set "fileName[66]=entityculling-neoforge-1.10.2-mc1.21.1.jar"
set "modURL[66]=https://www.dropbox.com/scl/fi/v601qrnemizajujcvz4ej/entityculling-neoforge-1.10.2-mc1.21.1.jar?rlkey=0dj9jvezhp24h2j4bye61ora7&st=eybtp0x8&dl=1"
 
set "fileName[67]=FarmersDelight-1.21.1-1.3.2.jar"
set "modURL[67]=https://www.dropbox.com/scl/fi/vid7gy8b7agreb6yvhkf5/FarmersDelight-1.21.1-1.3.2.jar?rlkey=uhoxoyp9o2fyp2onavc10boxy&st=576d1gef&dl=1"
 
set "fileName[68]=ferritecore-7.0.3-neoforge.jar"
set "modURL[68]=https://www.dropbox.com/scl/fi/lwdr3zr6hxf5v5e4h4923/ferritecore-7.0.3-neoforge.jar?rlkey=k3uwwk7wp8bnuj1t1mvkw6obo&st=mmut76p6&dl=1"
 
set "fileName[69]=fishingreal-neoforge-1.21.1-1.9.1.jar"
set "modURL[69]=https://www.dropbox.com/scl/fi/p56gke91fiee2p86j20xo/fishingreal-neoforge-1.21.1-1.9.1.jar?rlkey=rc0i6uowtis5hq9cdtpca60oi&st=drsbyj49&dl=1"
 
set "fileName[70]=ForgeConfigAPIPort-v21.1.6-1.21.1-NeoForge.jar"
set "modURL[70]=https://www.dropbox.com/scl/fi/5iwoc8osonefwtnxy1s60/ForgeConfigAPIPort-v21.1.6-1.21.1-NeoForge.jar?rlkey=3x53qxn4z3ia2wypvu0n3kk7v&st=x22heonk&dl=1"
 
set "fileName[71]=forgified-fabric-api-0.116.7-2.2.4-1.21.1.jar"
set "modURL[71]=https://www.dropbox.com/scl/fi/9g96koapq1c66dip6h7xy/forgified-fabric-api-0.116.7-2.2.4-1.21.1.jar?rlkey=y2p1lsqaxckqh938c6uynbt2k&st=0d5i3j9f&dl=1"
 
set "fileName[72]=fzzy_config-0.7.6-1.21-neoforge.jar"
set "modURL[72]=https://www.dropbox.com/scl/fi/uy8rtclntgd8y0lbhzs67/fzzy_config-0.7.6-1.21-neoforge.jar?rlkey=jh7odv5985puoyctrspfmioof&st=rnuirf9k&dl=1"
 
set "fileName[73]=geckolib-neoforge-1.21.1-4.8.4.jar"
set "modURL[73]=https://www.dropbox.com/scl/fi/2qgv1szarvc1x07oes68k/geckolib-neoforge-1.21.1-4.8.4.jar?rlkey=9foegn93ywgmcb2qsl2rd8e8h&st=t96tpbbw&dl=1"
 
set "fileName[74]=gliders-1.21.1-neoforge-1.1.8.jar"
set "modURL[74]=https://www.dropbox.com/scl/fi/ao4p4vbe0r4pxm2mt15i7/gliders-1.21.1-neoforge-1.1.8.jar?rlkey=rfra1ano1g1brxfjl9px360g9&st=7xu90m9i&dl=1"
 
set "fileName[75]=Icarus-NeoForge-4.7.3.jar"
set "modURL[75]=https://www.dropbox.com/scl/fi/1aan7f8eki4ewcz08uhxj/Icarus-NeoForge-4.7.3.jar?rlkey=6neqgami5chtwvkg3vbudasb6&st=9mxoe8kk&dl=1"
 
set "fileName[76]=ice_and_fire_spellbooks-2.3.3-1.21.1.jar"
set "modURL[76]=https://www.dropbox.com/scl/fi/y204rwhfd0ezlk97h65j2/ice_and_fire_spellbooks-2.3.3-1.21.1.jar?rlkey=rppcm6ra1p31ouit9d8p550rb&st=oqbfmvyf&dl=1"
 
set "fileName[77]=iceandfire-2.0-beta.17.jar"
set "modURL[77]=https://www.dropbox.com/scl/fi/qzdd09l7tpa0s5rbbm7uk/iceandfire-2.0-beta.17.jar?rlkey=9lpfqqkrne7x38wws5pmrwuag&st=h8sh0mdl&dl=1"
 
set "fileName[78]=iceandfirexbettercombat-1.21.1.jar"
set "modURL[78]=https://www.dropbox.com/scl/fi/q9bei4m2cw5ue34wotqiu/iceandfirexbettercombat-1.21.1.jar?rlkey=qpdfc6pg1ymzxca1sepw44m50&st=gj865gv4&dl=1"
 
set "fileName[79]=ImmediatelyFast-NeoForge-1.6.10-1.21.1.jar"
set "modURL[79]=https://www.dropbox.com/scl/fi/7658h3amc8tcbsp34xn2k/ImmediatelyFast-NeoForge-1.6.10-1.21.1.jar?rlkey=3i756823r3du006qce0pczbh1&st=ne20v3c8&dl=1"
 
set "fileName[80]=ImmersiveUI-NEOFORGE-0.3.3-1.21.1.jar"
set "modURL[80]=https://www.dropbox.com/scl/fi/1yo1uqitrm9jjqkgqc992/ImmersiveUI-NEOFORGE-0.3.3-1.21.1.jar?rlkey=wx9yqdg8x5m97jeotcbd66wbq&st=zlej1of3&dl=1"
 
set "fileName[81]=incubation-1.21.1-5.0.2.jar"
set "modURL[81]=https://www.dropbox.com/scl/fi/bvvu3ye3ukuqyvi1i6mmo/incubation-1.21.1-5.0.2.jar?rlkey=8s6ph9tykdq5ung766lua86nd&st=p5ua999d&dl=1"
 
set "fileName[82]=iris-neoforge-1.8.13-snapshot-mc1.21.1-local.jar"
set "modURL[82]=https://www.dropbox.com/scl/fi/75wj60dqap0vsbu53atwl/iris-neoforge-1.8.13-snapshot-mc1.21.1-local.jar?rlkey=cja827t4g4k5uqy45ikfeqa64&st=bq35gtpx&dl=1"
 
set "fileName[83]=irons_lib-1.21.1-1.0.2.jar"
set "modURL[83]=https://www.dropbox.com/scl/fi/u0f1u5bgvf9dn759sbw19/irons_lib-1.21.1-1.0.2.jar?rlkey=5uc7f9ns95bo6m063a6nqfjxs&st=pz67rhh8&dl=1"
 
set "fileName[84]=irons_spellbooks-1.21.1-3.16.0.jar"
set "modURL[84]=https://www.dropbox.com/scl/fi/m1gpxyfq5hrthh3u3kzd9/irons_spellbooks-1.21.1-3.16.0.jar?rlkey=drkhh2sskf78h0zimnijaqs2b&st=bet8ugjv&dl=1"
 
set "fileName[85]=Jade-1.21.1-NeoForge-15.10.5.jar"
set "modURL[85]=https://www.dropbox.com/scl/fi/8c0rlw5mlmw5op988xyee/Jade-1.21.1-NeoForge-15.10.5.jar?rlkey=fmljk4f9y7h5ajvbgmgiy0blx&st=icgclx4i&dl=1"
 
set "fileName[86]=JadeAddons-1.21.1-NeoForge-6.0.1.jar"
set "modURL[86]=https://www.dropbox.com/scl/fi/et6c0p0l5vfuu1vryj69i/JadeAddons-1.21.1-NeoForge-6.0.1.jar?rlkey=cpd051ulr6nrznmfohxa788yd&st=g0sufhlu&dl=1"
 
set "fileName[87]=jei-1.21.1-neoforge-19.27.0.340.jar"
set "modURL[87]=https://www.dropbox.com/scl/fi/j04iofmxs7knfm6yq0j2z/jei-1.21.1-neoforge-19.27.0.340.jar?rlkey=b9aq9iz6um7welrecfkkkv36d&st=a03vfzge&dl=1"
 
set "fileName[88]=journeymap-neoforge-1.21.1-6.0.0-beta.83.jar"
set "modURL[88]=https://www.dropbox.com/scl/fi/9j5odix6eocs02x8k9hcq/journeymap-neoforge-1.21.1-6.0.0-beta.83.jar?rlkey=nexbzhk8w5oi3zsnepcwh8brm&st=pky7r6v8&dl=1"
 
set "fileName[89]=jupiter-2.3.7-1.21.1-neoforge.jar"
set "modURL[89]=https://www.dropbox.com/scl/fi/sdogeijvrq3xk5sn4x31d/jupiter-2.3.7-1.21.1-neoforge.jar?rlkey=7ii1fkh5tgc35b4v5oy0hgm41&st=tns1xuhy&dl=1"
 
set "fileName[90]=JustEnoughResources-NeoForge-1.21.1-1.6.0.12.jar"
set "modURL[90]=https://www.dropbox.com/scl/fi/sr7tatp116hg1r9p4nedi/JustEnoughResources-NeoForge-1.21.1-1.6.0.12.jar?rlkey=u6i6x2hu48s9a984ilqqrmooa&st=hubkvqsb&dl=1"
 
set "fileName[91]=justzoom_neoforge_2.1.0_MC_1.21.1.jar"
set "modURL[91]=https://www.dropbox.com/scl/fi/qqezq74dewupgb07purlk/justzoom_neoforge_2.1.0_MC_1.21.1.jar?rlkey=yac3t7lgg8t4cuim361plgiqq&st=h0mekehj&dl=1"
 
set "fileName[92]=konkrete_neoforge_1.9.9_MC_1.21.jar"
set "modURL[92]=https://www.dropbox.com/scl/fi/b1z7sihrj2n721yelug55/konkrete_neoforge_1.9.9_MC_1.21.jar?rlkey=srxkz4xr4rjml86zlbxp1sm2j&st=ran2uri7&dl=1"
 
set "fileName[93]=kotlinforforge-5.11.0-all.jar"
set "modURL[93]=https://www.dropbox.com/scl/fi/1s2jj3bc5fhj5ipnrnoux/kotlinforforge-5.11.0-all.jar?rlkey=l6y66k2qziw7uoqt5uo729tty&st=vnjda855&dl=1"
 
set "fileName[94]=KotlinLangForge-2.12.1-k2.4.0-3.0-neoforge.jar"
set "modURL[94]=https://www.dropbox.com/scl/fi/j9adieh79gql7goswr86l/KotlinLangForge-2.12.1-k2.4.0-3.0-neoforge.jar?rlkey=tpuqzeicv1uqemg388ywdzolp&st=dwmrm4mc&dl=1"
 
set "fileName[95]=L_Ender's Cataclysm 1.21.1-3.31.jar"
set "modURL[95]=https://www.dropbox.com/scl/fi/btz4s3zf47ja21yeh7nf6/L_Ender-s-Cataclysm-1.21.1-3.31.jar?rlkey=hs4ovq9wnrktf1byzo2sv42p2&st=4dejarm6&dl=1"
 
set "fileName[96]=lendersdelight-1.21.1-1.0.10a.jar"
set "modURL[96]=https://www.dropbox.com/scl/fi/jx6d467zkrikfyoda8ehp/lendersdelight-1.21.1-1.0.10a.jar?rlkey=12i6p49v8l99mapekux77y4ni&st=flllf54g&dl=1"
 
set "fileName[97]=libraryferret-neoforge-1.21.1-4.0.0.jar"
set "modURL[97]=https://www.dropbox.com/scl/fi/3dpttzg5iwcbf2ieq2gub/libraryferret-neoforge-1.21.1-4.0.0.jar?rlkey=8xefi0oha59qyiuo7fabxgqzf&st=0g3wozxi&dl=1"
 
set "fileName[98]=lionfishapi-3.0.jar"
set "modURL[98]=https://www.dropbox.com/scl/fi/5hrgg8aiehmyok1b0qsg7/lionfishapi-3.0.jar?rlkey=c0rxf6yeakuh1qplgm0cy1fwk&st=l1cxfmrs&dl=1"
 
set "fileName[99]=lithium-neoforge-0.15.3-mc1.21.1.jar"
set "modURL[99]=https://www.dropbox.com/scl/fi/pslg22etcsyeb4747v6sp/lithium-neoforge-0.15.3-mc1.21.1.jar?rlkey=jdy4zmmo1rmna13j60mqk1u91&st=mrxyugre&dl=1"
 
set "fileName[100]=mca-neoforge-7.7.10-1.21.1.jar"
set "modURL[100]=https://www.dropbox.com/scl/fi/edmwl5ueifzep568u5bth/mca-neoforge-7.7.10-1.21.1.jar?rlkey=v5inm6tdcsnjpymqpkqg5jo6w&st=x80dcv6m&dl=1"
 
set "fileName[101]=mcacapitals-1.1.0.jar"
set "modURL[101]=https://www.dropbox.com/scl/fi/r1f400ha99d5h5v9ep4qi/mcacapitals-1.1.0.jar?rlkey=h9rb84n1ncre66sqjx7xdkj27&st=fslpv6o1&dl=1"
 
set "fileName[102]=MouseTweaks-neoforge-mc1.21-2.26.1.jar"
set "modURL[102]=https://www.dropbox.com/scl/fi/fpzuzwz3ec9lhp78j1lev/MouseTweaks-neoforge-mc1.21-2.26.1.jar?rlkey=1ave47qim3ay1419zuiw65oti&st=d50rihzx&dl=1"
 
set "fileName[103]=MutantMonsters-v21.1.1-1.21.1-NeoForge.jar"
set "modURL[103]=https://www.dropbox.com/scl/fi/idupftiz0onvby9f7gwfb/MutantMonsters-v21.1.1-1.21.1-NeoForge.jar?rlkey=59xsgqwgsgtkivfkccosrj7lg&st=v1jgt1hr&dl=1"
 
set "fileName[104]=neapolitan-1.21.1-6.0.1.jar"
set "modURL[104]=https://www.dropbox.com/scl/fi/hmbdomz864qll5wc7t9vf/neapolitan-1.21.1-6.0.1.jar?rlkey=o3nx3cujaqb8pd8tsm3wkxdv5&st=dkctqman&dl=1"
 
set "fileName[105]=nemos-inventory-sorting-NeoForge-1.21.1-1.8.2.1.jar"
set "modURL[105]=https://www.dropbox.com/scl/fi/c9nnmxiorwb3i52zqxh2w/nemos-inventory-sorting-NeoForge-1.21.1-1.8.2.1.jar?rlkey=77neqtfc3kstsf14m25h3d8rj&st=v6u1f5lj&dl=1"
 
set "fileName[106]=OctoLib-NEOFORGE-0.6.2-1.21.jar"
set "modURL[106]=https://www.dropbox.com/scl/fi/egwfnkq3p7p7pshfzf622/OctoLib-NEOFORGE-0.6.2-1.21.jar?rlkey=bvdsubzwkhdldct2kjqqsze2y&st=zo022i7l&dl=1"
 
set "fileName[107]=OverflowingBars-v21.1.1-1.21.1-NeoForge.jar"
set "modURL[107]=https://www.dropbox.com/scl/fi/dyeeca19q3tpnkk5n3suz/OverflowingBars-v21.1.1-1.21.1-NeoForge.jar?rlkey=p9y08lut9q88jbb5uyl7ky1de&st=vnwa41oe&dl=1"
 
set "fileName[108]=owo-lib-neoforge-0.12.15.5-beta.1-1.21.jar"
set "modURL[108]=https://www.dropbox.com/scl/fi/ur00kywdlyazrdx53wbmf/owo-lib-neoforge-0.12.15.5-beta.1-1.21.jar?rlkey=q2m3ctxjc80xudvsn6nz6pwzj&st=wz6f27kt&dl=1"
 
set "fileName[109]=Patchouli-1.21.1-93-NEOFORGE.jar"
set "modURL[109]=https://www.dropbox.com/scl/fi/rcir1cdrizcamhcmz7xv7/Patchouli-1.21.1-93-NEOFORGE.jar?rlkey=ryd21o0lhj4p1wp5dz8o6l421&st=2434r6s0&dl=1"
 
set "fileName[110]=pet_cemetery-1.21.1-3.0.1.jar"
set "modURL[110]=https://www.dropbox.com/scl/fi/zkvf9lcruw3po0z7xookw/pet_cemetery-1.21.1-3.0.1.jar?rlkey=052rbc503uh35kuj3xdgdn0d0&st=k1suxen0&dl=1"
 
set "fileName[111]=loot_journal-neoforge-1.21.1-6.2.1.jar"
set "modURL[111]=https://www.dropbox.com/scl/fi/hmv48p1g5wj82ikh4x8a7/loot_journal-neoforge-1.21.1-6.2.1.jar?rlkey=8dvd0brkaovqjyiy93g30vjkf&st=vadem5x9&dl=1"
 
set "fileName[112]=Placebo-1.21.1-9.9.1.jar"
set "modURL[112]=https://www.dropbox.com/scl/fi/qjwzgipv7hz1kltlg1nsd/Placebo-1.21.1-9.9.1.jar?rlkey=534x6gsuafye8gvr0zh2hi7ui&st=gwmawwu0&dl=1"
 
set "fileName[113]=player-animation-lib-forge-2.0.4-1.21.1.jar"
set "modURL[113]=https://www.dropbox.com/scl/fi/vbsbf2zc00mzu7971oo46/player-animation-lib-forge-2.0.4-1.21.1.jar?rlkey=788hgrpvc8zm33xhv009j22jx&st=bxr8xd9m&dl=1"
 
set "fileName[114]=PlayerAnimationLibNeoforge-1.1.4-mc.1.21.1.jar"
set "modURL[114]=https://www.dropbox.com/scl/fi/cpjn9s8kqbmqxly7ren2m/PlayerAnimationLibNeoforge-1.1.4-mc.1.21.1.jar?rlkey=k06jd5mr4y6spbh4tt9do1yj8&st=jfw0r4im&dl=1"
 
set "fileName[115]=prickle-neoforge-1.21.1-21.1.11.jar"
set "modURL[115]=https://www.dropbox.com/scl/fi/seaglo6emxjxzstj7xrcs/prickle-neoforge-1.21.1-21.1.11.jar?rlkey=gpniamra9xbznhh4w1khlnfn3&st=3innozg0&dl=1"
 
set "fileName[116]=PuzzlesLib-v21.1.51-1.21.1-NeoForge.jar"
set "modURL[116]=https://www.dropbox.com/scl/fi/n0hz6ugzy231shpu0wp86/PuzzlesLib-v21.1.51-1.21.1-NeoForge.jar?rlkey=n25edchs42dkjnf07r91aybhp&st=dwuix3os&dl=1"
 
set "fileName[117]=redirected-neoforge-1.0.0-1.21.1.jar"
set "modURL[117]=https://www.dropbox.com/scl/fi/kmix0vs9uoqt43224vweb/redirected-neoforge-1.0.0-1.21.1.jar?rlkey=jmpnk0ghe7c0n3q5ie3f6u05d&st=umvtzxn4&dl=1"
 
set "fileName[118]=resourcefulconfig-neoforge-1.21-3.0.11.jar"
set "modURL[118]=https://www.dropbox.com/scl/fi/v7e0vmx2csnsqk75jsu51/resourcefulconfig-neoforge-1.21-3.0.11.jar?rlkey=k9t74w5rma8zrnojbgzyfo5zd&st=vnhnfo31&dl=1"
 
set "fileName[119]=ritchiesprojectilelib-2.1.2-mc.1.21.1-neoforge.jar"
set "modURL[119]=https://www.dropbox.com/scl/fi/pe3xwr2z4mk9o56yerrrp/ritchiesprojectilelib-2.1.2-mc.1.21.1-neoforge.jar?rlkey=fax0w78anmfidbk344ylvjork&st=1xc0pg9s&dl=1"
 
set "fileName[120]=sable_new_sodium_compat-1.0.0.jar"
set "modURL[120]=https://www.dropbox.com/scl/fi/n7hsk5ujm0ig9ovg839ru/sable_new_sodium_compat-1.0.0.jar?rlkey=rzmxlexqhsu5oe3auob06fp5v&st=t36479sr&dl=1"
 
set "fileName[121]=sable-neoforge-1.21.1-1.2.2.jar"
set "modURL[121]=https://www.dropbox.com/scl/fi/joppcauf5rnv9dr2d5kyk/sable-neoforge-1.21.1-1.2.2.jar?rlkey=56q2a4fo307qpurk1yre69u8i&st=0wkg0plu&dl=1"
 
set "fileName[122]=sablecollisiondamage-1.0.7.jar"
set "modURL[122]=https://www.dropbox.com/scl/fi/2uj8k7g9yqh78w9q50t51/sablecollisiondamage-1.0.7.jar?rlkey=t4wfyo6e209at3h2hbwcp9k6e&st=9wjeocqn&dl=1"
 
set "fileName[123]=sliceanddice-forge-4.2.4.jar"
set "modURL[123]=https://www.dropbox.com/scl/fi/jvevdfm9246di8rfol1fj/sliceanddice-forge-4.2.4.jar?rlkey=lmpozttlxc7x3rjyuvcdf7nze&st=334da58f&dl=1"
 
set "fileName[124]=smoothswapping-0.9.3.2-1.21.1-neoforge.jar"
set "modURL[124]=https://www.dropbox.com/scl/fi/7qsou28xtr9rjzuk5dcem/smoothswapping-0.9.3.2-1.21.1-neoforge.jar?rlkey=cl0z8egt3snt78radkcwrua5b&st=8a3t8uej&dl=1"
 
set "fileName[125]=sneak_through_berries-neoforge-21.1.0.jar"
set "modURL[125]=https://www.dropbox.com/scl/fi/yqr94jo4qv0zf5o7xf3g9/sneak_through_berries-neoforge-21.1.0.jar?rlkey=o9txk0oevbhmha982koivh51y&st=tfvm9spm&dl=1"
 
set "fileName[126]=sodium-neoforge-0.8.12-alpha.4-mc1.21.1.jar"
set "modURL[126]=https://www.dropbox.com/scl/fi/1vlg3zxxasumy5rrdnrl3/sodium-neoforge-0.8.12-alpha.4-mc1.21.1.jar?rlkey=hvmchdeado71kp9xoyjl3kf24&st=3qnv7vye&dl=1"
 
set "fileName[127]=sophisticatedbackpacks-1.21.1-3.25.57.1871.jar"
set "modURL[127]=https://www.dropbox.com/scl/fi/zacopvsjc3ld4gml515kf/sophisticatedbackpacks-1.21.1-3.25.57.1871.jar?rlkey=0ej5s056fryl6zvac5ue7b87z&st=fnz51ngr&dl=1"
 
set "fileName[128]=sophisticatedcore-1.21.1-1.4.53.2003.jar"
set "modURL[128]=https://www.dropbox.com/scl/fi/z2bp880adc7apalpd2bmz/sophisticatedcore-1.21.1-1.4.53.2003.jar?rlkey=pnzhbaocazkp0gpcqeak3mbj3&st=fvadwk4a&dl=1"
 
set "fileName[129]=sophisticatedstorage-1.21.1-1.5.57.1814.jar"
set "modURL[129]=https://www.dropbox.com/scl/fi/7qkfvmln43tolmwcruatj/sophisticatedstorage-1.21.1-1.5.57.1814.jar?rlkey=e2vhmr43kgzg25hkgbik8umns&st=7bgs2xox&dl=1"
 
set "fileName[130]=sound-physics-remastered-neoforge-1.21.1-1.4.10.jar"
set "modURL[130]=https://www.dropbox.com/scl/fi/8xdarnxdrb1g2ztmsu4wa/sound-physics-remastered-neoforge-1.21.1-1.4.10.jar?rlkey=19n37fjdz0jfbq34ln69zy4qq&st=yxji05rd&dl=1"
 
set "fileName[131]=Sparkweave-NeoForge-0.510.0.jar"
set "modURL[131]=https://www.dropbox.com/scl/fi/hi32ji3k2k30qc40kqanj/Sparkweave-NeoForge-0.510.0.jar?rlkey=j1rvplhe7svntyqdkg5kkxjlu&st=q56m5ie6&dl=1"
 
set "fileName[132]=supermartijn642configlib-1.1.8-neoforge-mc1.21.jar"
set "modURL[132]=https://www.dropbox.com/scl/fi/wz0b6y0mhvygll9zuy9v5/supermartijn642configlib-1.1.8-neoforge-mc1.21.jar?rlkey=me70iry8db4onkqil2d3tclbw&st=1oywes0b&dl=1"
 
set "fileName[133]=tf_dnv-2.0.3.jar"
set "modURL[133]=https://www.dropbox.com/scl/fi/gziekfsw4prsm5bsbsj1j/tf_dnv-2.0.3.jar?rlkey=aq54cjr0tcsa2up9er1yw9br0&st=sksbfbmy&dl=1"
 
set "fileName[134]=tfmg-1.2.0.jar"
set "modURL[134]=https://www.dropbox.com/scl/fi/abdh29eht4301bma49akb/tfmg-1.2.0.jar?rlkey=8dwobd33nloei219j0xng5oim&st=ysgi3erv&dl=1"
 
set "fileName[135]=toms_storage-1.21-2.3.2.jar"
set "modURL[135]=https://www.dropbox.com/scl/fi/9m37b4sj9w8tg3vlqbsrr/toms_storage-1.21-2.3.2.jar?rlkey=ole4gq32w5n1skv5py3j9l30k&st=6u6bczmz&dl=1"
 
set "fileName[136]=traveloptics-4.4.0.1-1.21.1.jar"
set "modURL[136]=https://www.dropbox.com/scl/fi/esprhi4cmdnpbndnleqit/traveloptics-4.4.0.1-1.21.1.jar?rlkey=z651mfheuf3ixcvtbb4e8iykg&st=lh180hd1&dl=1"
 
set "fileName[137]=treeharvester-1.21.1-9.1.jar"
set "modURL[137]=https://www.dropbox.com/scl/fi/hdu914a3qxnxjykb90bla/treeharvester-1.21.1-9.1.jar?rlkey=t5sprnqw2j2yx7vskdum3pw25&st=o2s8naqm&dl=1"
 
set "fileName[138]=twilightdelight-3.2.2.jar"
set "modURL[138]=https://www.dropbox.com/scl/fi/0mhhgntne1vovfxziyy3y/twilightdelight-3.2.2.jar?rlkey=s7cmpzyheatsdr4dizq2owi29&st=lr2l9hyk&dl=1"
 
set "fileName[139]=twilightforest-1.21.1-4.8.3345-universal.jar"
set "modURL[139]=https://www.dropbox.com/scl/fi/lp6dra61f12sut6x4zmxx/twilightforest-1.21.1-4.8.3345-universal.jar?rlkey=ndpz8wwvhipnu5lv4rbbx7zhy&st=daxq6x0a&dl=1"
 
set "fileName[140]=txnilib-neoforge-1.0.24-1.21.1.jar"
set "modURL[140]=https://www.dropbox.com/scl/fi/8oqzxdpdfq1itxetj96as/txnilib-neoforge-1.0.24-1.21.1.jar?rlkey=osi4sp10s79uo2ltwwd71zktu&st=o6zbwzrx&dl=1"
 
set "fileName[141]=uranus-2.4.1-1.21.1-neoforge.jar"
set "modURL[141]=https://www.dropbox.com/scl/fi/f9wa6bp554r1tq5zrz6vi/uranus-2.4.1-1.21.1-neoforge.jar?rlkey=9lbqk3a07707i3x83qqfscc0z&st=yz1wwj08&dl=1"
 
set "fileName[142]=veil-neoforge-1.21.1-4.1.2.jar"
set "modURL[142]=https://www.dropbox.com/scl/fi/rzsd689tzt484qjod13ms/veil-neoforge-1.21.1-4.1.2.jar?rlkey=jmat4uijz55uwslmmw9ejcl4u&st=g5afwhjw&dl=1"
 
set "fileName[143]=veinminer-client-neoforge-2.10.1-1.21.1.jar"
set "modURL[143]=https://www.dropbox.com/scl/fi/l0d98w3u39wfxznnr9rd4/veinminer-client-neoforge-2.10.1-1.21.1.jar?rlkey=bex6cip0aicc6uso579iiwi2u&st=th9rubnt&dl=1"
 
set "fileName[144]=veinminer-neoforge-2.10.1-1.21.1.jar"
set "modURL[144]=https://www.dropbox.com/scl/fi/cc4znr6j3vezo7j1tfu32/veinminer-neoforge-2.10.1-1.21.1.jar?rlkey=vvy1ag17yq4ik63em6yjdgius&st=wbxowrex&dl=1"
 
set "fileName[145]=watut-neoforge-1.21.0-1.2.7.jar"
set "modURL[145]=https://www.dropbox.com/scl/fi/l2pta8f92c9bfgeha9f99/watut-neoforge-1.21.0-1.2.7.jar?rlkey=8mcotuubwza8hjfdxlb5cz8nf&st=tyxkhczv&dl=1"
 
set "fileName[146]=waystones-neoforge-1.21.1-21.1.34.jar"
set "modURL[146]=https://www.dropbox.com/scl/fi/20moqua1imv04uphj40wx/waystones-neoforge-1.21.1-21.1.34.jar?rlkey=xng80dtz35asm21ubn6zo6ty0&st=1p8l5xqt&dl=1"
 
set "fileName[147]=waystonessable-1.0.3.jar"
set "modURL[147]=https://www.dropbox.com/scl/fi/zu6piqqz2hbplu1dx9h5v/waystonessable-1.0.3.jar?rlkey=xseippjskj3jyekkxuajlgvtb&st=vtpi9f86&dl=1"
 
set "fileName[148]=woodworks-1.21.1-4.0.2.jar"
set "modURL[148]=https://www.dropbox.com/scl/fi/f4605o4o5x5ckwm7kqlbe/woodworks-1.21.1-4.0.2.jar?rlkey=5qqtfxgldvez61364rc7djufa&st=ijn2uulv&dl=1"

set "fileName[149]=logbegone-neoforge-1.21.1-1.0.3.jar"
set "modURL[149]=https://www.dropbox.com/scl/fi/5f59n6f1kf3hko6j1auq5/logbegone-neoforge-1.21.1-1.0.3.jar?rlkey=3q45j8adiksey9wyuv45z18th&st=4zh5jlei&dl=1"

set "fileName[150]=polymorph-neoforge-1.1.0+1.21.1.jar"
set "modURL[150]=https://www.dropbox.com/scl/fi/81x05l9bad63s9u3a4fwo/polymorph-neoforge-1.1.0-1.21.1.jar?rlkey=i8pyyi14tt0vbsqpye81pvrq8&st=39ntlfz8&dl=1"

set "fileName[151]=plasmovoice-neoforge-1.21.1-2.1.10.jar"
set "modURL[151]=https://www.dropbox.com/scl/fi/aprao7ekk1oi5fav69ju3/plasmovoice-neoforge-1.21.1-2.1.10.jar?rlkey=7ieosbzn21s80d0delkn9j6ux&st=hg7hk27a&dl=1"

set "fileName[152]=chunksfadein-neoforge-3.0.23-1.21.jar"
set "modURL[152]=https://www.dropbox.com/scl/fi/i5ha0onj9rnjw1qfy734m/chunksfadein-neoforge-3.0.23-1.21.jar?rlkey=t3y4bs8uhus2k2k2r55u9e7eh&st=bzfdswzi&dl=1"

set "fileName[153]=pv-addon-soundphysics-1.1.2.jar"
set "modURL[153]=https://www.dropbox.com/scl/fi/dulv2me1pu3ftopb6lnp6/pv-addon-soundphysics-1.1.2.jar?rlkey=w6sv4ysck3lr9nos68tirbswy&st=jhi1k2d9&dl=1"

set "fileName[154]=explosiveenhancement-neoforge-1.21.1-1.1.2.jar"
set "modURL[154]=https://www.dropbox.com/scl/fi/v80lw0reucswqeraiegmq/explosiveenhancement-neoforge-1.21.1-1.1.2.jar?rlkey=enbb03ff4keij0bvp38au92u4&st=hfauibbx&dl=1"

set "fileName[155]=BetterPingDisplay-1.21.1-1.1.jar"
set "modURL[155]=https://www.dropbox.com/scl/fi/pkfnp6clb2lrd3bw5zqs8/BetterPingDisplay-1.21.1-1.1.jar?rlkey=taltajfcdjirt4pjaueugjszi&st=wey2y2cr&dl=1"

set "fileName[156]=underlay-1.0.2-neoforge-mc1.21.1.jar"
set "modURL[156]=https://www.dropbox.com/scl/fi/q739m4qvv7epsnk5o0b36/underlay-1.0.2-neoforge-mc1.21.1.jar?rlkey=7ie1cxp6166o6t9dey2wxwzol&st=eet0ghze&dl=1"

set "fileName[157]=configured-neoforge-1.21.1-2.6.3.jar"
set "modURL[157]=https://www.dropbox.com/scl/fi/bp8ucmuafckyo8emqqjlv/configured-neoforge-1.21.1-2.6.3.jar?rlkey=n92ri4rxiachphwwhww0c1dvu&st=8vri75eq&dl=1"

set "fileName[158]=chalk-1.6.12.jar"
set "modURL[158]=https://www.dropbox.com/scl/fi/fcfmimycx7onlei0nmlle/chalk-1.6.12.jar?rlkey=e8zst8fr738nvk1slotkw4sdq&st=7w7unbc0&dl=1"

set "fileName[159]=obscure_tooltips-neoforge-1.21.1-4.2.2.jar"
set "modURL[159]=https://www.dropbox.com/scl/fi/bw2zacccmrmu8a7g34jsi/obscure_tooltips-neoforge-1.21.1-4.2.2.jar?rlkey=6ie073sx7bmoskaqhaqz6g4cv&st=hof9tzg5&dl=1"

set "fileName[160]=fragmentum-neoforge-1.21.1-2.2.4.jar"
set "modURL[160]=https://www.dropbox.com/scl/fi/ue9xzv4gt065b42tognzr/fragmentum-neoforge-1.21.1-2.2.4.jar?rlkey=2kib2emsd33a88qmt21ou0ec4&st=7nd2vbzn&dl=1"

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