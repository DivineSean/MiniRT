NAME = MiniRT
NAME_BONUS = MiniRT_Bonus
SRC = Mandatory/mandatory_free.c Mandatory/ft_strtrim.c Mandatory/camera.c Mandatory/color.c Mandatory/cy_routine.c Mandatory/cylinder.c Mandatory/diffuse.c Mandatory/execution.c Mandatory/get_next_line.c Mandatory/get_next_line_utils.c Mandatory/intersection.c Mandatory/light_utils.c Mandatory/light.c Mandatory/Main.c Mandatory/memset_calloc.c Mandatory/Parssing.c Mandatory/parssing_utils.c Mandatory/parssing_utils_1.c Mandatory/parssing_utils_2.c Mandatory/parssing_utils_3.c Mandatory/parssing_utils_4.c Mandatory/parssing_utils_5.c Mandatory/parssing_utils_6.c Mandatory/parssing_utils_7.c Mandatory/parssing_utils_8.c Mandatory/parssing_utils_9.c Mandatory/parssing_utils_10.c Mandatory/pl_routine.c Mandatory/plane.c Mandatory/raytracing.c Mandatory/shade.c Mandatory/sphere.c Mandatory/split.c Mandatory/utils.c Mandatory/vecrot_utils.c Mandatory/vector.c
SRC_BONUS = bonus/loading_texture.c bonus/free_bonus.c bonus/cone.c bonus/ft_strtrim.c bonus/camera.c bonus/color.c bonus/cy_routine.c bonus/cylinder.c bonus/diffuse.c bonus/execution.c bonus/get_next_line.c bonus/get_next_line_utils.c bonus/intersection.c bonus/light_utils.c bonus/light.c bonus/Main.c bonus/memset_calloc.c bonus/Parssing.c bonus/parssing_utils.c bonus/parssing_utils_1.c bonus/parssing_utils_2.c bonus/parssing_utils_3.c bonus/parssing_utils_4.c bonus/parssing_utils_5.c bonus/parssing_utils_6.c bonus/parssing_utils_7.c bonus/parssing_utils_8.c bonus/parssing_utils_9.c bonus/parssing_utils_10.c bonus/pl_routine.c bonus/plane.c bonus/raytracing.c bonus/shade.c bonus/sphere.c bonus/split.c bonus/utils.c bonus/vecrot_utils.c bonus/vector.c bonus/diffuse_extra.c bonus/diffuse_extra2.c bonus/ambient_light.c
MLXFRAME = -lmlx -framework OpenGL -framework AppKit
CFLAGS = -Wall -Wextra -Werror -g
OBJS = $(SRC:.c=.o)
OBJS_BONUS = $(SRC_BONUS:.c=.o)
INC = Mandatory/Minirt.h
INC_BONUS = bonus/Minirt.h
R        := $(shell tput -Txterm setaf 1)
G        := $(shell tput -Txterm setaf 2)
Y       := $(shell tput -Txterm setaf 3)

all: $(NAME)
	@echo $(G) "ALL functions are done!"

$(NAME): $(OBJS)
	@echo $(Y) Compiling: $< ... Done!
	@cc $(CFLAGS) $(MLXFRAME) $(OBJS) -o $@

%.o: %.c $(INC)
	@echo $(Y) Compiling: $< ... Done!
	@cc $(CFLAGS) -c $< -o $(<:.c=.o)

bonus: ${NAME_BONUS}
	@echo $(Y) Compiling: $< ... Done!

$(NAME_BONUS) : $(OBJS_BONUS) $(INC_BONUS)
	@echo $(Y) Compiling: $< ... Done!
	@cc $(CFLAGS) $(MLXFRAME) $(OBJS_BONUS) -o $(NAME_BONUS)

clean:
	@echo $(R) Cleaned
	@rm -f $(OBJS) $(OBJS_BONUS)

fclean: clean
	@echo $(R) Fully cleaned
	@rm -f $(NAME) $(NAME_BONUS)

re: fclean all

.PHONY: clean fclean re bonus all