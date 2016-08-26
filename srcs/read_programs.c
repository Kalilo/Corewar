/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   read_programs.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arnovan- <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/23 10:09:11 by arnovan-          #+#    #+#             */
/*   Updated: 2016/08/26 10:39:01 by arnovan-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "corewar.h"

/*	Reverse byte function incase we need it later
**  ---------------------------------------------
**
**	static char_u	reverse_bytes(unsigned char bytes)
**	{
**		char_u rev;
**
**		rev = bytes;
**		rev = ((rev & 0b00001111) << 4) | ((rev & 0b11110000) >> 4);
**		rev = ((rev & 0b00110011) << 2) | ((rev & 0b11001100) >> 2);
**		rev = ((rev & 0b01010101) << 1) | ((rev & 0b10101010) >> 1);
**		return (rev);
**	}
*/

static void		make_magic(t_env *env, int p_num)
{
	char_u	buffer[4];

	if (read(env->fd, buffer, 4) > 0)
	{
		if ((buffer[1] == 0xea) && (buffer[2] == 0x83) && (buffer[3] == 0xf3))
			env->players[p_num].player_ref.magic = COREWAR_EXEC_MAGIC;
		else
			error_quit(8);
	}
	else
		error_quit(8);
}

static void		read_name(t_env *env, int p_num)
{
	char_u	buffer[PROG_NAME_LENGTH + 4];
	int		x;

	x = 0;
	if (read(env->fd, buffer, PROG_NAME_LENGTH + 4) > 0)
	{
		while (buffer[x] != 0x00 && x < PROG_NAME_LENGTH)
		{
			env->players[p_num].player_ref.prog_name[x] = buffer[x];
			x++;
		}
		env->players[p_num].player_ref.prog_name[x] = '\0';
	}
}

static void		read_size(t_env *env, int p_num)
{
	char_u		buffer[4];
	ul_int		result;
	int			x;

	x = 0;
	result = 0;
	if (read(env->fd, buffer, 4) > 0)
	{
		while (x < 4)
		{
			result = (result << 8) + buffer[x];
			x++;
		}
		if (result > CHAMP_MAX_SIZE)
			error_quit(9);
		env->players[p_num].player_ref.prog_size = result;
	}
}

static void		read_comment(t_env *env, int p_num)
{
	char_u	buffer[COMMENT_LENGTH + 4];
	int		x;

	x = 0;
	if (read(env->fd, buffer, COMMENT_LENGTH + 4) > 0)
	{
		while (buffer[x] != 0x00 && x < COMMENT_LENGTH)
		{
			env->players[p_num].player_ref.comment[x] = buffer[x];
			x++;
		}
		env->players[p_num].player_ref.comment[x] = '\0';
	}
}

void		read_programs(t_env *env)
{
//	int				p_num;

//	p_num = env->current_player;
	while (env->current_player <= (env->num_players - 1))
	{
		if ((env->fd = open(env->players[env->current_player].file_name, O_RDONLY)) == -1)
			error_quit(7);
		make_magic(env, env->current_player);
		read_name(env, env->current_player);
		read_size(env, env->current_player);
		read_comment(env, env->current_player);
		load_arena(env, env->current_player);
		close(env->fd);
		env->current_player++;
	}

	//////////////////////////////////////////////////////////

	ul_int x;
	x = 0;
	while (x < MEM_SIZE)
	{
		printf("%x", env->memory[x]);
		if (x % 100 == 0)
			printf("\n");
		x++;
	}
	printf("\n");


}


