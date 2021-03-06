/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_long_fork.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: khansman <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/27 09:43:14 by khansman          #+#    #+#             */
/*   Updated: 2016/09/01 13:12:13 by rojones          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "corewar.h"

int		ft_long_fork(t_env *env, t_arg_code arg_len, t_process *pro)
{
puts("long fork called");
	t_list		*new;
	t_process	*n_pro;
	t_list		*temp;

	if (!(new = ft_lstnew(pro, sizeof(t_process))))
		error_quit(0);
	n_pro = (t_process *)new->content;
	if (!(n_pro->registers = (t_reg *)malloc(REG_SIZ * REG_NUMBER)))
		error_quit(0);
	ft_memcpy(n_pro->registers, pro->registers, REG_SIZ * REG_NUMBER);
	n_pro->pc += MEM_ARG(0);
	temp = env->processes;
	while (temp->next)
		temp = temp->next;
	temp->next = new;
	(void)arg_len;
	return (pro->carry);
}
