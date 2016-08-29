/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init_functions.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rojones <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/23 16:59:18 by rojones           #+#    #+#             */
/*   Updated: 2016/08/29 10:51:53 by arnovan-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "corewar.h"

void	init_functions(t_env *env)
{
	env->function[0] = NULL;
	env->function[1] = 0;// ft_live;
	env->function[2] = 0;//ft_load;
	env->function[3] = 0;//ft_store;
	env->function[4] = 0;//ft_add;
	env->function[5] = 0;//ft_sub;
	env->function[6] = 0;//ft_add;
	env->function[7] = 0;//ft_or;
	env->function[8] = 0;//ft_xor;
	env->function[9] = 0;//ft_zjump;
	env->function[10] = 0;//ft_load_index;
	env->function[11] = 0;//ft_store_index;
	env->function[12] = 0;//ft_fork;
	env->function[13] = 0;//ft_long_load;
	env->function[14] = 0;//ft_long_load_index;
	env->function[15] = 0;//ft_long_fork;
	env->function[16] = 0;//ft_aff;
}
