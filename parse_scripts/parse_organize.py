import re

list_of_hip= [
"hipChooseDevice",
"hipDeviceGetAttribute",
"hipDeviceGetByPCIBusId",
"hipDeviceGetCacheConfig",
"hipDeviceGetLimit",
"hipDeviceGetP2PAttribute",
"hipDeviceGetPCIBusId",
"hipDeviceGetSharedMemConfig",
"hipDeviceGetStreamPriorityRange",
"hipDeviceSetLimit",
"hipDeviceSetSharedMemConfig",
"hipDeviceSynchronize",
"hipGetDevice",
"hipGetDeviceCount",
"hipGetDeviceFlags",
"hipGetDeviceProperties",
"hipIpcCloseMemHandle",
"hipIpcGetEventHandle",
"hipIpcGetMemHandle",
"hipIpcOpenEventHandle",
"hipIpcOpenMemHandle",
"hipSetDevice",
"hipSetDeviceFlags",
"hipDeviceReset",
"hipDeviceSetCacheConfig",
"hipGetErrorName",
"hipGetErrorString",
"hipGetLastError",
"hipPeekAtLastError",
"hipStreamAddCallback",
"hipStreamAttachMemAsync",
"hipStreamCreate",
"hipStreamCreateWithFlags",
"hipStreamCreateWithPriority",
"hipStreamDestroy",
"hipStreamGetFlags",
"hipStreamGetPriority",
"hipStreamQuery",
"hipStreamSynchronize",
"hipStreamWaitEvent",
"hipEventCreate",
"hipEventCreateWithFlags",
"hipEventDestroy",
"hipEventElapsedTime",
"hipEventQuery",
"hipEventRecord",
"hipEventSynchronize",
"hipFuncGetAttributes",
"hipFuncSetAttribute",
"hipFuncSetCacheConfig",
"hipFuncSetSharedMemConfig",
"hipLaunchCooperativeKernel",
"hipLaunchCooperativeKernelMultiDevice",
"hipLaunchKernel",
"hipLaunchKernelGGL",
"hipOccupancyMaxActiveBlocksPerMultiprocessor",
"hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags",
"hipOccupancyMaxPotentialBlockSize",
"hipOccupancyMaxPotentialBlockSizeWithFlags",
"hipFree",
"hipFreeArray",
"hipHostFree",
"hipFreeMipmappedArray",
"hipGetMipmappedArrayLevel",
"hipGetSymbolAddress",
"hipGetSymbolSize",
"hipHostGetDevicePointer",
"hipHostGetFlags",
"hipHostRegister",
"hipHostUnregister",
"hipMalloc",
"hipMalloc3D",
"hipMalloc3DArray",
"hipMallocArray",
"hipHostMalloc",
"hipMallocManaged",
"hipMallocMipmappedArray",
"hipMallocPitch",
"hipMemAdvise",
"hipMemGetInfo",
"hipMemPrefetchAsync",
"hipMemRangeGetAttribute",
"hipMemRangeGetAttributes",
"hipMemcpy",
"hipMemcpy2D",
"hipMemcpy2DAsync",
"hipMemcpy2DFromArray",
"hipMemcpy2DFromArrayAsync",
"hipMemcpy2DToArray",
"hipMemcpy3D",
"hipMemcpy3DAsync",
"hipMemcpyAsync",
"hipMemcpyFromSymbol",
"hipMemcpyFromSymbolAsync",
"hipMemcpyPeer",
"hipMemcpyPeerAsync",
"hipMemcpyToSymbol",
"hipMemcpyToSymbolAsync",
"hipMemset",
"hipMemset2D",
"hipMemset2DAsync",
"hipMemset3D",
"hipMemset3DAsync",
"hipMemsetAsync",
"hipExtent",
"hipPitchedPtr",
"hipPos",
"hipMemcpyFromArray",
"hipMemcpyToArray",
"hipMemcpyToArrayAsync",
"hipPointerGetAttributes",
"hipDeviceCanAccessPeer",
"hipDeviceDisablePeerAccess",
"hipDeviceEnablePeerAccess",
"hipBindTexture",
"hipBindTexture2D",
"hipBindTextureToArray",
"hipBindTextureToMipmappedArray",
"hipCreateChannelDesc",
"hipGetChannelDesc",
"hipGetTextureAlignmentOffset",
"hipGetTextureReference",
"hipUnbindTexture",
"hipGetTextureObjectTextureDesc",
"hipCreateTextureObject",
"hipDestroyTextureObject",
"hipGetTextureObjectResourceDesc",
"hipGetTextureObjectResourceViewDesc",
"hipCreateSurfaceObject",
"hipDestroySurfaceObject",
"hipDriverGetVersion",
"hipRuntimeGetVersion",
"hipProfilerStart",
"hipProfilerStop",
"hipConfigureCall",
"hipLaunchByPtr",
"hipSetupArgument" ]



def make_list( app_list, total_list, file_name ) :
    with open(file_name) as f:
        for line in f:
            for api_routine in list_of_hip:
                if api_routine in line:
                    if not re.search(api_routine+"[A-Z0-9]", line) or api_routine+"(" in line:
                        app_list[api_routine]=app_list[api_routine]+1
                        total_list[api_routine]=total_list[api_routine]+1


for i in list_of_hip:
    if list_of_hip.count(i) >  1:
        print(f'{i}: UGH')

total_list = { i : 0 for i in list_of_hip }

input_list={ "BabelStream" : "output_BabelStream",
"cs-roofline-toolkit" : "output_cs-roofline-toolkit",
"rocHPCG" : "output_rocHPCG",
"cholla" : "output_cholla",
"KokkosDslash" : "output_KokkosDslash",
"miniWeather" : "output_miniWeather",
"su3_bench" : "output_su3_bench",
"add4" : "output_add4",
"cuda-stream" : "output_cuda-stream",
"gpu-burn" : "output_gpu-burn",
"mini-nbody" : "output_mini-nbody",
"reduction" : "output_reduction",
"rodinia_3.0" : "output_rodinia_3.0",
"rtm8" : "output_rtm8",
"strided-access" : "output_strided-access",
"vectorAdd" : "output_vectorAdd",
"GPU-STREAM" : "output_GPU-STREAM",
"mixbench" : "output_mixbench",
"BinomialOption" : "output_BinomialOption",
"BitonicSort" : "output_BitonicSort",
"FastWalshTransform" : "output_FastWalshTransform",
"FloydWarshall" : "output_FloydWarshall",
"HelloWorld" : "output_HelloWorld",
"Histogram" : "output_Histogram",
"MatrixMultiplication" : "output_MatrixMultiplication",
"PrefixSum" : "output_PrefixSum",
"RecursiveGaussian" : "output_RecursiveGaussian",
"SimpleConvolution" : "output_SimpleConvolution",
"dct" : "output_dct",
"dwtHaar1D" : "output_dwtHaar1D"
}

list_of_apps = {}
for app in input_list.keys():
    app_list = { i : 0 for i in list_of_hip }
    print(input_list[app])
    make_list( app_list, total_list, input_list[app] )
    list_of_apps[app] = app_list



print("Unique calls across apps")

unique_num = { i : 0 for i in list_of_hip }

for app in list_of_apps.keys():
    print(f'{app}')
    for hip_routine in list_of_apps[app].keys():
        if list_of_apps[app][hip_routine] > 0:
            unique_num[hip_routine] = unique_num[hip_routine]+1

for r in unique_num.keys():
    print(f'{r},{unique_num[r]}')

print(unique_num)


list_of_apps["Total"] = total_list

print("Per app results:")
for app in list_of_apps.keys():
    print(f'{app}')
    for hip_routine in list_of_apps[app].keys():
        if list_of_apps[app][hip_routine] > 0:
            print(f'   {hip_routine},{list_of_apps[app][hip_routine]}')


print("Results across all:")
print("HIP runtime routine,",end="")
for app in list_of_apps.keys():
    print(f'{app},',end="")

print()

for i in list_of_hip:
    print(f'{i},',end="")
    for app in list_of_apps.keys():
        for hip_routine in list_of_apps[app].keys():
            if hip_routine == i:
                print(f'{list_of_apps[app][hip_routine]},', end='')
    print()

