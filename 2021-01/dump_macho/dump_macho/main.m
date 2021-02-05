//
//  main.m
//  dump_macho
//
//  Created by delims on 2021/1/14.
//

#import <Foundation/Foundation.h>

#import <mach-o/loader.h>
#import <mach-o/fat.h>

int main(int argc, const char * argv[]) {
    char *path = "/Volumes/respective/14/Thunder";
    
    int p = open(path, O_RDONLY);
    if (p == -1) {
        printf("open file error \n");
    } else {
        printf("open file success with handle %i \n",p);
    }
    
    char buffer[1024],load_buffer[4096],sec_buffer[1024];
    
    read(p, buffer, sizeof(struct mach_header));
    
    struct mach_header *header = (struct mach_header *)buffer;
    
    printf("%x \n",header->magic);
    
    switch (header->magic) {
        case MH_MAGIC:
            printf("%s \n","MH_MAGIC");
            break;
        case MH_CIGAM:
            printf("%s \n","MH_CIGAM");
            break;
        case MH_MAGIC_64:
            printf("%s \n","MH_MAGIC_64");
            break;
        case MH_CIGAM_64:
            printf("%s \n","MH_CIGAM_64");
            break;
        case FAT_CIGAM:
            printf("%s \n","FAT_CIGAM");
            break;
        case FAT_MAGIC:
            printf("%s \n","FAT_MAGIC");
            break;
        default:
            break;
    }
    if (MH_MAGIC_64 != header->magic) return 0;
    
    struct mach_header_64 *header_64 = (struct mach_header_64 *)buffer;
    
    printf("magic %x \n",header_64->magic);
    printf("cputype %x \n",header_64->cputype);
    printf("cpusubtype %x \n",header_64->cpusubtype);
    printf("cpusubtype %x \n",header_64->cpusubtype);
    printf("ncmds %d \n",header_64->ncmds);
    printf("sizeofcmds %d \n",header_64->sizeofcmds);
    printf("magic %x \n",header_64->flags);
    
    lseek(p, sizeof(struct mach_header_64), SEEK_SET);
    
    struct load_command *lc;
    
    
    for (int i = 0; i < header_64->ncmds; i ++) {
        long long current = lseek(p, 0, SEEK_CUR);
        read(p, load_buffer, sizeof(struct load_command));
        lc = (struct load_command*)load_buffer;
        printf("cmd %x ; cmdsize %d \n",lc->cmd, lc->cmdsize);
        if (lc->cmd == LC_SEGMENT_64) {
            lseek(p, -8, SEEK_CUR);
            printf("current offset = % lli \n",current);
            
            read(p, load_buffer, sizeof(struct segment_command_64));
            
            struct segment_command_64 *command_64 = (struct segment_command_64 *)load_buffer;
            printf("\n");
            printf("segmentname %s \n",command_64->segname);
            printf("vmaddr %llx \n",command_64->vmaddr);
            printf("vmsize %llu \n",command_64->vmsize);
            printf("fileoff %llu \n",command_64->fileoff);
            printf("filesize %llu \n",command_64->filesize);
            printf("maxprot %x \n",command_64->maxprot);
            printf("initprot %x \n",command_64->initprot);
            printf("nsects %d \n",command_64->nsects);
            printf("flags %d \n",command_64->flags);
            printf("\n");
            
            
            struct section_64 *section;
            for (int j = 0; j < command_64->nsects; j ++) {
                read(p, sec_buffer, sizeof(struct section_64));
                section = (struct section_64*)sec_buffer;
                
                printf("segname %s,sectname %s \n",section->segname,section->sectname);
                printf("addr %llx \n",section->addr);
                printf("size %llu \n",section->size);

                
            }
            
                        
            if (lc->cmdsize > sizeof(struct segment_command_64)) {
                printf("found interspace size :%d \n", lc->cmdsize - sizeof(struct segment_command_64));
            }
        }
        
        lseek(p, current + lc->cmdsize, SEEK_SET);
    }

    printf("\n");
    printf("segment_command_64 size: %lu \n",sizeof(struct segment_command_64));
    printf("section_64 size: %lu \n",sizeof(struct section_64));

    
    return 0;
}


