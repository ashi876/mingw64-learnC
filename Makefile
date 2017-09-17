#ԭ���ߣ�zyl910 �μ��޸ļ�ע����Ա������ǧ������
#��makefile�������£�
#make BITS=32//(����32λ����.�ĳ�64������64λ)
#make RELEASE=0//(0Ϊdebug�棬1Ϊrelease��)
#����make RELEASE=0 BITS=32//(32λ��debug��)��
#���ؾ��档�����ڵڶ��е�һ��Ҫ�����������ǿո��Ҵ����ϸ�����Щ�������⿨N��~

# flags
CC = g++
#����Ϊָ��������Ϊg++��gcc
CFLAGS = -Wall
#����Ϊ�����-Wall����/
LFLAGS = 
#����ָ�����ļ�·��
# args
RELEASE =0
#����(0Ϊdebug�棬1Ϊrelease��)���������п������������ָ����
BITS =
#�����ļ���λ�����������п������������ָ����

# [args] ����ģʽ. 0����debugģʽ, 1����releaseģʽ.����Ϊmake RELEASE=0��1
ifeq ($(RELEASE),0)
    # debug#debug�棺���� -g ���������ɵ�����Ϣ��
    CFLAGS += -g
	BB =debug
else
    # release#release�棺���� -static ���������о�̬���ӣ�ʹ������������̬�⡣���� -O3 ��������������ٶ��Ż�������-DNDEBUG����������NDEBUG�꣬���ζ��ԡ�
    CFLAGS += -static -O3 -DNDEBUG
    LFLAGS += -static
	BB =release
endif

# [args] ����λ��. 32����32λ����, 64����64λ����, ����Ĭ��.����Ϊmake BITS=32��64
#��û��-m32��-m64����ʱ��һ������»����ɸ�����ϵͳλ��һ�µĴ��룬��ĳЩ��������������
ifeq ($(BITS),32)
    CFLAGS += -m32
    LFLAGS += -m32
	AA =32
else
    ifeq ($(BITS),64)
        CFLAGS += -m64
        LFLAGS += -m64
		AA =64
    else
    endif
endif


.PHONY : all clean

# files,��Ҫ���Ӵ����ļ���������ϵʱ���޸Ĵ���
TARGETS = main
OBJS = main.o

all : $(TARGETS)

main : $(OBJS)
	$(CC) $(LFLAGS) -o $@$(AA)$(BB) $^
#˵����$@--Ŀ���ļ�����������main.exe,$^--���е������ļ�OBJS =����ļ���$<--��һ�������ļ���
	
main.o : main.cpp
	$(CC) $(CFLAGS) -c $<
#˵����$<--��һ�������ļ�,���иĳ�$^����


clean :
	@del -f $(OBJS) $(TARGETS)*.exe 2>nul
#����ԭ��Ϊ:	rm -f $(OBJS) $(TARGETS) $(addsuffix .exe,$(TARGETS))
#������Ψһ��ͨ���linux�¸�delΪrm����Windows�µĿ�ִ���ļ�����չ����exe������ʹ����addsuffix�������ӡ�.exe����չ������Linux�²�������.exe��ִ���ļ�����Windows�²�����������չ���Ŀ�ִ���ļ�������rm�����Ҳ����ļ�����������ʱ���Լ���-f�������Ըô���
	
#ȫ��������	
#���make RELEASE=0��Ϊ(Ĭ��λ����)debug�档
#���make RELEASE=1��Ϊ(Ĭ��λ����)release�档
#���make BITS=32��Ϊ32λ(��debug)�档
#���make BITS=64��Ϊ64λ(��debug)�档
#���make RELEASE=0 BITS=32��Ϊ32λ��debug�档
#���make RELEASE=0 BITS=64��Ϊ64λ��debug�档
#���make RELEASE=1 BITS=32��Ϊ32λ��release�档
#���make RELEASE=1 BITS=64��Ϊ64λ��release�档
#���make clean��Ϊ������ɵ��ļ�