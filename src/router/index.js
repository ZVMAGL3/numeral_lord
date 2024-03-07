import { createRouter, createWebHashHistory } from 'vue-router';
import store from '../store/index';
import userMain from '/src/pages/userMain.vue'

const routerHistory = createWebHashHistory();
//引入组件

const router = createRouter({
	history:routerHistory,
    routes:[
        {
            path:'/',
            redirect:'userMain', 
        },
        {
            path:'/userMain',
            name:'userMain',
            component:userMain,
            beforeEnter: (to, from, next) => {

				if(store.state.homePage.userLoginState === 'jumpOver'){
                    store.dispatch('homePage/homePageInitialization').then(() => {
                        next()
                    })
				}else{
					next()
				}
			},
        },
        {
            path:'/mapEdit',
            name:'mapEdit',
            component:() => import('/src/pages/mapEdit/mapEdit.vue')
        },
        {
            path:'/gameRoom',
            name:'gameRoom',
            component:() => import('/src/pages/mapEdit/gameRoom.vue')
        }
    ]
})

router.beforeEach((to, from, next) => {
    console.log('to:',to)
    console.log('from', from)
    if(from.fullPath === '/userMain'){
        if(store.state.homePage.showLoginModal){
            store.commit('homePage/eventShowLoginModal',false)
            next(false)
        }else{
            next()
        }
    }else{
        next()
    }
  });

  export default router;