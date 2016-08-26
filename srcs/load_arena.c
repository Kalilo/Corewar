/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   load_arena.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arnovan- <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/26 09:33:03 by arnovan-          #+#    #+#             */
/*   Updated: 2016/08/26 10:24:04 by arnovan-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "corewar.h"

void		load_arena(t_env *env, int p_num)
{
	ul_int x = 0;
	char_u	buffer[env->players[p_num].player_ref.prog_size];

	if (read(env->fd, buffer, env->players[p_num].player_ref.prog_size) > 0)
	{



/*
//////////////////////////////////////////////////////////////////////
		ul_int x = 0;
		while (x < env->players[p_num].player_ref.prog_size)
		{
			printf("%x", buffer[x]);
			x++;
		}
			printf("\n");
//////////////////////////////////////////////////////////////////////
*/
	x = 0;
	while (x < env->players[p_num].player_ref.prog_size)
	{
		env->memory[x + p_num] = buffer[x];
		x++;
	}

	}
}
