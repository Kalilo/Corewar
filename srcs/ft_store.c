/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_store.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rojones <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/24 15:46:18 by rojones           #+#    #+#             */
/*   Updated: 2016/08/24 17:20:02 by rojones          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "corewar.h"

static void	ft_store_indir(t_env *env, t_process *pro, char_u reg_num)
{
	int	i;
	ul_int	jump;

	i = -1;
	jump = 0;
	while (++i < IND_SIZE)
	{
		jump = (pro->pc + i < MEM_SIZE) ?
			(jump << 8) + env->memory[pro->pc + i] :
			(jump << 8) + env->memory[pro->pc + i - MEM_SIZE];
	}
	jump = jump % IDX_MOD;
	i = -1;
	while (++i < REG_SIZE)
		(pro->pc + jump + i < MEM_SIZE) ?
			env->memory[pro->pc + jump + i] = pro->registers[reg_num][i]:
			env->memory[pro->pc + jump + i - MEM_SIZE] = pro->registers[reg_num][i];
}

void	ft_store(t_env *env, t_arg_code *acode, t_process *pro)
{
	char_u	reg_num1;
	char_u	reg_num2;

	if (acod.arg1 != REG_CODE || get_arg_len(acode.arg2) == DIR_CODE)
		return ;
	reg_num1 = env->memory[pro->pi + 2] - 1;
	if (reg_num1 > REG_NUMBER)
		return ;
	if (acode.arg2 == REG_CODE)
	{
		reg_num2 = env->memory[pro->pi + 3] - 1;
		if (reg_num2 > REG_NUMBER)
			ft_memcpy(pro->registers[reg_num2], pro->registers[reg_num1],
					REG_SIZE);
	}
	else
		ft_store_indir(env, pro, reg_num);
}
