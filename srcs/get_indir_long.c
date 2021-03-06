/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_indir_long.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rojones <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/26 10:19:59 by rojones           #+#    #+#             */
/*   Updated: 2016/09/04 09:48:42 by rojones          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "corewar.h"

char_u	*get_indir_long(char_u *mem, t_ulint offset, t_process *pro)
{
	t_ulint	temp_ind;
	char_u	*temp;
	t_ulint	jump;
	int		i;

	jump = 0;
	i = -1;
	if (!(temp = (char_u*)malloc(sizeof(u_char) * REG_SIZE)))
		return (NULL);
	ft_bzero(temp, REG_SIZE);
	while (++i < IND_SIZE)
	{
		temp_ind = loop_mem(offset + i);
		jump = (jump << 8) + mem[temp_ind];
	}
	i = -1;
	jump = loop_mem(pro->pc + (jump));
	while (++i < REG_SIZE)
		temp[i] = mem[loop_mem(jump + i)];
	return (temp);
}
